import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

abstract class NavigationMiddleware {
  late BuildContext _context;
  late GoRouterState _state;

  BuildContext get context => _context;

  GoRouterState get state => _state;

  ProviderContainer get ref => ProviderScope.containerOf(_context);

  String? call(BuildContext context, GoRouterState state) {
    _context = context;
    _state = state;
    return onRedirect();
  }

  String? onRedirect();

  /// Get a location from route name and parameters.
  /// This is useful for redirecting to a named location.
  String namedLocation(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
  }) {
    return state.namedLocation(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }
}
