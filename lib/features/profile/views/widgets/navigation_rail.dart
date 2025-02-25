import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:profile/features/profile/views/widgets/action_icons.dart';
import 'package:profile/features/profile/views/widgets/my_image.dart';
import 'package:profile/features/profile/views/widgets/r_g_initial.dart';

class AppNavigationRail extends ResponsiveConsumerStatefulWidget {
  const AppNavigationRail({Key? key}) : super(key: key);

  ResponsiveConsumerState<AppNavigationRail> createState() =>
      _AppNavigationRailState();
}

class _AppNavigationRailState
    extends ResponsiveConsumerState<AppNavigationRail> {
  var selectedIndex = 0;

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

  Widget buildNavRail() {
    return NavigationRail(
      extended: true,
      selectedIndex: selectedIndex,
      destinations: destinations(),
      leading: buildLeading(),
    );
  }

  Widget buildLeading() {
    return Column(
      children: [
        SizedBox(height: 40),
        RGInitial(),
        ActionIcons(),
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
