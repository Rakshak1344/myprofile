import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class MyAppConfig extends AppConfig {
  @override
  Future<void> initDependencies() async {}

  @override
  FutureOr<Widget> onInit({required Widget child}) {
    return child;
  }

  @override
  FutureOr<List<Override>> overrides() async {
    return [];
  }

  @override
  FutureOr<List<ProviderObserver>> observers() {
    return [];
  }
}
