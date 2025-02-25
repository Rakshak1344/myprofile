import 'package:profile/arch/navigation/middlewares/multiple_navigation_middleware.dart';
import 'package:profile/arch/navigation/middlewares/navigation_middleware.dart';

class RootNavigationMiddleware extends NavigationMiddleware {
  final String buildNumber;

  RootNavigationMiddleware(this.buildNumber);

  @override
  String? onRedirect() {
    return MultipleNavigationMiddleware([
      // ForceUpdateNavigationMiddleware(buildNumber),
      // UnderMaintenanceNavigationMiddleware(),
      // TrackNavigationMiddleware(),
    ]).call(context, state);
  }
}
