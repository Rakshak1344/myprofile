import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

abstract class AppConfig {
  static AppConfig? _instance;

  List<Override>? _overrides;

  static AppConfig get instance => _instance!;

  AppConfig() {
    _instance = this;
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'AppNavigator',
  );

  /// Init Dependencies is called before onInit, overrides and observers
  /// This is where you can initialize your dependencies
  Future<void> initDependencies();

  FutureOr<Widget> onInit({required Widget child});

  Future<Widget> init({required Widget child}) async {
    demangleStackTrace();
    WidgetsFlutterBinding.ensureInitialized();
    await initDependencies();

    var app = await onInit(child: child);

    return ProviderScope(
      overrides: _overrides ?? await overrides(),
      observers: await observers(),
      child: app,
    );
  }

  FutureOr<List<ProviderObserver>> observers();

  FutureOr<List<Override>> overrides();

  @visibleForTesting
  void setOverrides(List<Override> overrides) {
    _overrides = overrides;
  }

  /// This is added to fix the issue with stack trace caused by riverpod
  /// Check this issue for more details
  /// https://stackoverflow.com/a/73770713
  void demangleStackTrace() {
    FlutterError.demangleStackTrace = (StackTrace stack) {
      if (stack is stack_trace.Trace) {
        return stack.vmTrace;
      }

      if (stack is stack_trace.Chain) {
        return stack.toTrace().vmTrace;
      }

      return stack;
    };
  }
}
