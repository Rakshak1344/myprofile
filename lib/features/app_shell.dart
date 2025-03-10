import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/responsive_view.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:profile/features/app_navigation_buttons.dart';
import 'package:profile/features/app_popup_menu_button.dart';
import 'package:profile/features/profile/views/widgets/navigation_rail.dart';
import 'package:profile/features/profile/views/widgets/r_g_initial.dart';
import 'package:profile/navigation/routes/app_route_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppShell extends ResponsiveConsumerStatefulWidget {
  final Widget child;

  final GoRouterState state;

  const AppShell({
    super.key,
    required this.child,
    required this.state,
  });

  @override
  ResponsiveConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ResponsiveConsumerState<AppShell> {
  @override
  Widget buildDesktop(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          AppNavigationRail(state: widget.state),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: buildMobileAppBar(),
      body: widget.child,
    );
  }

  @override
  Widget buildTablet(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: widget.child,
      appBar: AppBar(
        elevation: 0.0,
        title: const RGInitial(),
        actions: [AppNavigationButtons(state: widget.state)],
      ),
    );
  }

  PreferredSizeWidget buildMobileAppBar() {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: const RGInitial(),
      actions: [AppPopupMenuButton(state: widget.state)],
    );
  }

  Widget buildNavButton(
    String label,
    IconData icon,
    String routeName,
  ) {
    final currentPath = "/${widget.state.uri.pathSegments.first}";
    return TextButton.icon(
      onPressed: () {
        if (ResponsiveWidget.isSmallScreen(context)) {
          AppConfig.navigatorKey.currentContext?.pop();
        }

        AppConfig.navigatorKey.currentContext?.goNamed(routeName);
      },
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.compact,
        shape: const StadiumBorder(),
        side: currentPath == '/$routeName'
            ? const BorderSide(color: Colors.black)
            : null,
      ),
      label: Text(label),
      icon: Icon(icon),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white70,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Colors.black),
      title: const RGInitial(),
    );
  }

  List<String> routesNames = [
    AppRouteName.me,
    AppRouteName.career,
    AppRouteName.projects,
    AppRouteName.education,
    AppRouteName.contact,
  ];

  int get index {
    var location = widget.state.uri.toString();
    // Create new location without query parameters
    if (location.contains('?')) {
      location = location.substring(0, location.indexOf('?'));
    }

    return routesNames.indexWhere(
      (String route) => context.namedLocation(route) == location,
    );
  }
}
