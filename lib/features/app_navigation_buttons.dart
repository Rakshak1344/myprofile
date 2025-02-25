import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/navigation/routes/app_route_name.dart';

class NavigationBarButtons extends StatelessWidget {
  final GoRouterState state;

  const NavigationBarButtons({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final currentPath = state.uri.toString();

    Widget buildNavButton(String label, IconData icon, String routeName) {
      return TextButton.icon(
        onPressed: () => context.goNamed(routeName),
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // buildNavButton("Me", Icons.person_outline_rounded, AppRouteName.me),
        // const SizedBox(width: 4),
        buildNavButton("Career", Icons.computer, AppRouteName.career),
        const SizedBox(width: 4),
        buildNavButton("Projects", Icons.code, AppRouteName.projects),
        const SizedBox(width: 4),
        buildNavButton(
            "Education", Icons.star_border_rounded, AppRouteName.education),
        const SizedBox(width: 4),
        buildNavButton("Contact", Icons.email_outlined, AppRouteName.contact),
        const SizedBox(width: 8),
      ],
    );
  }
}
