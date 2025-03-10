import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/responsive_view.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:profile/navigation/routes/app_route_name.dart';

class AppNavigationButtons extends ResponsiveConsumerStatefulWidget {
  final GoRouterState state;

  const AppNavigationButtons({super.key, required this.state});

  @override
  ResponsiveConsumerState<AppNavigationButtons> createState() =>
      _AppNavigationButtonsState();
}

class _AppNavigationButtonsState
    extends ResponsiveConsumerState<AppNavigationButtons> {
  @override
  Widget buildDesktop(BuildContext context, WidgetRef ref) {
    return buildRow();
  }

  @override
  Widget buildTablet(BuildContext context, WidgetRef ref) {
    return buildRow();
  }

  @override
  Widget buildMobile(BuildContext context, WidgetRef ref) {
    return buildColumn();
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

  Widget buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildNavButton(
          "Career",
          Icons.computer,
          AppRouteName.career,
        ),
        const SizedBox(width: 4),
        buildNavButton(
          "Projects",
          Icons.code,
          AppRouteName.projects,
        ),
        const SizedBox(width: 4),
        buildNavButton(
          "Education",
          Icons.star_border_rounded,
          AppRouteName.education,
        ),
        const SizedBox(width: 4),
        buildNavButton(
          "Contact",
          Icons.email_outlined,
          AppRouteName.contact,
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildNavButton(
          "Career",
          Icons.computer,
          AppRouteName.career,
        ),
        const SizedBox(height: 4),
        buildNavButton(
          "Projects",
          Icons.code,
          AppRouteName.projects,
        ),
        const SizedBox(height: 4),
        buildNavButton(
          "Education",
          Icons.star_border_rounded,
          AppRouteName.education,
        ),
        const SizedBox(height: 4),
        buildNavButton(
          "Contact",
          Icons.email_outlined,
          AppRouteName.contact,
        ),
      ],
    );
  }
}
