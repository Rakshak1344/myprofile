import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:profile/features/profile/views/widgets/my_image.dart';
import 'package:profile/features/profile/views/widgets/r_g_initial.dart';
import 'package:profile/navigation/routes/app_route_name.dart';

class AppNavigationRail extends ResponsiveConsumerStatefulWidget {
  final GoRouterState state;

  const AppNavigationRail({Key? key, required this.state}) : super(key: key);

  ResponsiveConsumerState<AppNavigationRail> createState() =>
      _AppNavigationRailState();
}

class _AppNavigationRailState
    extends ResponsiveConsumerState<AppNavigationRail> {
  @override
  Widget buildMobile(BuildContext context, WidgetRef ref) {
    return buildNavRail();
  }

  @override
  Widget buildTablet(BuildContext context, WidgetRef ref) {
    return buildNavRail();
  }

  @override
  Widget buildDesktop(BuildContext context, WidgetRef ref) {
    return buildNavRail();
  }

  List<String> routesNames = [
    AppRouteName.me,
    AppRouteName.career,
    AppRouteName.projects,
    AppRouteName.education,
    AppRouteName.contact,
  ];

  int get index {
    var basePath = "/${widget.state.uri.pathSegments.first}";

    return routesNames.indexWhere(
      (String route) => context.namedLocation(route) == basePath,
    );
  }

  Widget buildNavRail() {
    return NavigationRail(
      extended: false,
      selectedIndex: index,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.primary,
      ),
      labelType: NavigationRailLabelType.selected,
      indicatorColor: Theme.of(context).colorScheme.secondaryContainer,
      indicatorShape: ShapeBorder.lerp(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        1,
      ),
      destinations: destinations(),
      leading: buildLeading(),
      onDestinationSelected: (int index) {
        context.goNamed(routesNames[index]);
      },
    );
  }

  Widget buildLeading() {
    return Column(
      children: [
        SizedBox(height: 40),
        RGInitial(),
        // ActionIcons(),
      ],
    );
  }

  List<NavigationRailDestination> destinations() {
    return [
      NavigationRailDestination(
        icon: SizedBox(height: 26, width: 26, child: MyImage()),
        label: AutoSizeText(
          'Rakshith Gajendra',
          style: GoogleFonts.sacramento(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.computer),
        label: Text("Career"),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.code),
        label: Text("Projects"),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.star_border_rounded),
        label: Text("Education"),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.email_outlined),
        label: Text("Contact"),
      ),
    ];
  }
}
