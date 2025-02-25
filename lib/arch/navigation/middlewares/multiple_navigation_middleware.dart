import 'package:collection/collection.dart';
import 'package:profile/arch/navigation/middlewares/navigation_middleware.dart';

class MultipleNavigationMiddleware extends NavigationMiddleware {
  final List<NavigationMiddleware> middlewares;

  MultipleNavigationMiddleware(this.middlewares);

  @override
  String? onRedirect() {
    var middleware = middlewares.firstWhereOrNull((middleware) {
      var redirectPath = middleware(context, state);

      return redirectPath != null;
    });

    return middleware?.call(context, state);
  }
}
