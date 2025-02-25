import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:profile/features/app_navigation_buttons.dart';
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

  ResponsiveConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ResponsiveConsumerState<AppShell> {
  @override
  Widget buildDesktop(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          AppNavigationRail(),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: buildMobileAppBar(),
      endDrawer: Drawer(
        child: Column(
          children: [Text("Drawer")],
        ),
      ),
      body: widget.child,
    );
  }

  @override
  Widget buildTablet(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: widget.child,
      appBar: AppBar(
        title: RGInitial(),
        actions: [NavigationBarButtons(state: widget.state)],
      ),
    );
  }

  PreferredSizeWidget buildMobileAppBar() {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: RGInitial(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white70,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.black),
      title: RGInitial(),
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

  Widget buildNavBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (int index) => context.goNamed(routesNames[index]),
      destinations: [
        // TextButton.icon(
        //   onPressed: () {},
        //   label: Text("Me"),
        //   icon: Icon(Icons.person_outline_rounded),
        // ),
        NavigationDestination(
            icon: Icon(Icons.person_outline_rounded), label: "Me"),
        NavigationDestination(icon: Icon(Icons.computer), label: "Career"),
        NavigationDestination(icon: Icon(Icons.code), label: "Projects"),
        NavigationDestination(
            icon: Icon(Icons.star_border_rounded), label: "Education"),
        NavigationDestination(
            icon: Icon(Icons.email_outlined), label: "Contact")
      ],
    );
  }

// Widget buildInfoIcon(BuildContext context) {
//   return Container(
//     width: MediaQuery.of(context).size.width * 0.5,
//     height: MediaQuery.of(context).size.height,
//     child: Drawer(
//       elevation: 0.0,
//       child: ListView(
//         padding: EdgeInsets.all(20),
//         children: <Widget>[
//           NavButton(
//             text: "Info",
//             iconColor: Colors.red,
//             icon: MdiIcons.informationOutline,
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) => InfoDialog(),
//                 barrierDismissible: true,
//               );
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
