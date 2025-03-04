import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:profile/arch/navigation/middlewares/navigation_middleware.dart';
import 'package:profile/navigation/middlewares/root_navigation_middleware.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_notifier.g.dart';

/// This notifier is meant to implement the [Listenable]
/// for our [GoRouter] needs.
///
/// We aim to trigger redirects whenever it is needed.
/// This is done by calling our (only) listener everytime we want to notify stuff.
/// This allows to centralize global redirecting logic in this class.
@Riverpod(keepAlive: true)
class RouterNotifier extends _$RouterNotifier implements Listenable {
  /// _routerListener is the callback that we will call when we want to notify
  /// GoRouter that it should redirect.
  VoidCallback? _routerListener;

  /// _redirect is our root navigation middleware.
  /// It will be called everytime the user navigates to any route.
  NavigationMiddleware? _redirect;

  @override
  Future<void> build() async {
    /// We listen to the state of our providers to trigger redirections.
    /// We can probably simplify this further. We might also need to add
    /// a couple of checks to reduce the number of times we call the listener.

    // ref.listen(
    //   userStateProvider.selectAsync((data) => data),
    //       (_, __) => updateRootNavigationMiddleware(),
    // );

    // ref.listen(
    //   featureFlagStateProvider.selectAsync((data) => data),
    //       (_, next) => updateRootNavigationMiddleware(),
    // );

    await updateRootNavigationMiddleware();

    /// This probably won't be called ever, but it's here just in case.
    /// We need to test this.
    ref.listenSelf((_, __) {
      // One could write more conditional logic for when to call redirection
      if (state.isLoading) {
        return;
      }
      _routerListener?.call();
    });
  }

  /// Redirects the user our core state changes.
  String? redirect(BuildContext context, GoRouterState state) {

    if (state.matchedLocation == '/') {
      return '/me';
    }

    if (this.state.isLoading || this.state.hasError) {
      return null;
    }

    return _redirect?.call(context, state);
  }

  /// Adds [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method on creation to handle its
  /// internal [ChangeNotifier].
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void addListener(VoidCallback listener) => _routerListener = listener;

  /// Removes [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method when disposing,
  /// so that it removes its callback when destroyed.
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void removeListener(VoidCallback listener) => _routerListener = null;

  /// We can probably simplify this further. But we might need to refactor
  /// How feature flags are handled. We could also probably move the build number
  /// logic to a provider of its own.
  Future<void> updateRootNavigationMiddleware() async {
    var packageInfo = await PackageInfo.fromPlatform();
    _redirect = RootNavigationMiddleware(packageInfo.buildNumber);

    _routerListener?.call();
  }
}
