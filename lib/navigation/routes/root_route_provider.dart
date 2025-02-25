import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/navigation/route_provider.dart';
import 'package:profile/features/other/views/under_maintenance_view.dart';
import 'package:profile/navigation/routes/app_route_name.dart';

class RootRouteProvider extends RouteProvider {
  @override
  List<RouteBase> routes() {
    return <GoRoute>[
      GoRoute(
        path: '/under-maintenance',
        name: AppRouteName.underMaintenance,
        builder: (BuildContext context, GoRouterState state) =>
            const UnderMaintenanceView(),
      ),
    ];
  }
}
