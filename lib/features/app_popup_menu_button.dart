import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/responsive_view.dart';
import 'package:profile/navigation/routes/app_route_name.dart';

class AppPopupMenuButton extends StatelessWidget {
  final GoRouterState state;

  const AppPopupMenuButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (data) {
        log(data);
      },
      icon: buildPopupButtonIcon(context),
      itemBuilder: (context) {
        return buildNavButtons();
        // return routesNames.sublist(1).map((String route) {
        //   return PopupMenuItem(
        //     child:
        //         // buildNavButton(
        //         //   route[0].toUpperCase() + route.substring(1),
        //         //   Icons.computer,
        //         //   AppRouteName.career,
        //         // ),
        //         ListTile(
        //       iconColor: Theme.of(context).colorScheme.primary,
        //       title: Text(route[0].toUpperCase() + route.substring(1)),
        //       onTap: () {
        //         context.pop();
        //         context.goNamed(route);
        //       },
        //     ),
        //   );
        // }).toList();
      },
    );
  }

  Icon buildPopupButtonIcon(BuildContext context) {
    return Icon(
      MdiIcons.hamburger,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  PopupMenuItem buildNavButton(
    String label,
    IconData icon,
    String routeName,
  ) {
    final currentPath = "/${state.uri.pathSegments.first}";
    return PopupMenuItem(
      child: TextButton.icon(
        onPressed: () {
          var context = AppConfig.navigatorKey.currentContext;
          if (ResponsiveWidget.isSmallScreen(context!)) {
            context.pop();
          }

          context.goNamed(routeName);
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
      ),
    );
  }

  List<PopupMenuEntry> buildNavButtons() {
    return [
      buildNavButton(
        "Career",
        Icons.computer,
        AppRouteName.career,
      ),
      // const SizedBox(height: 4),
      buildNavButton(
        "Projects",
        Icons.code,
        AppRouteName.projects,
      ),
      // const SizedBox(height: 4),
      buildNavButton(
        "Education",
        Icons.star_border_rounded,
        AppRouteName.education,
      ),
      // const SizedBox(height: 4),
      buildNavButton(
        "Contact",
        Icons.email_outlined,
        AppRouteName.contact,
      ),
    ];
  }
}
