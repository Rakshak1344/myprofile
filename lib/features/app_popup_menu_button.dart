import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/navigation/routes/app_route_name.dart';

class AppPopupMenuButton extends StatelessWidget {
  final GoRouterState state;

  const AppPopupMenuButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemData>(
      icon: Icon(
        MdiIcons.hamburger,
        color: Theme.of(context).colorScheme.primary,
      ),
      itemBuilder: (context) => MenuItemData.menuItems.map((item) {
        final currentPath = "/${state.uri.pathSegments.first}";
        final isSelected = currentPath == '/${item.route}';

        return PopupMenuItem<MenuItemData>(
          onTap: () => context.goNamed(item.route),
          value: item,
          child: Container(

            decoration: BoxDecoration(
              border: isSelected ? Border.all(width: 2) : null,
              borderRadius: BorderRadius.circular(32),

            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  color:
                      isSelected ? Theme.of(context).colorScheme.primary : null,
                ),
                const SizedBox(width: 10),
                Text(item.label),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class MenuItemData {
  final String label;
  final IconData icon;
  final String route;

  MenuItemData({required this.label, required this.icon, required this.route});

  static List<MenuItemData> menuItems = [
    MenuItemData(
        label: "Career", icon: Icons.computer, route: AppRouteName.career),
    MenuItemData(
        label: "Projects", icon: Icons.code, route: AppRouteName.projects),
    MenuItemData(
        label: "Education",
        icon: Icons.star_border_rounded,
        route: AppRouteName.education),
    MenuItemData(
        label: "Contact",
        icon: Icons.email_outlined,
        route: AppRouteName.contact),
  ];
}
