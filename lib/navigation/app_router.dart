import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/analytics.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/navigation/route_provider.dart';
import 'package:profile/navigation/routes/app_route_provider.dart';
import 'package:profile/navigation/routes/root_route_provider.dart';
import 'package:profile/navigation/router_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> goRouter(GoRouterRef ref) {
  var notifier = ref.read(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: AppConfig.navigatorKey,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: AppRouter().routes(),
    observers: [AnalyticsNavigationObserver()],
  );
}

class AppRouter {
  /// Our application routes. Obtained through code generation
  List<RouteBase> routes() =>
      routeProviders().fold([], (prev, e) => [...prev, ...e.routes()]);

  List<RouteProvider> routeProviders() {
    return [
      RootRouteProvider(),
      AppRoutesProvider(),
    ];
  }
}
