import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:profile/features/profile/views/widgets/built_responsive_flutter.dart';
import 'profile_info.dart';
import '../../../arch/view/responsive_view.dart';
import '../../socials/views/social_info.dart';

class ProfilePage extends ResponsiveConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  ResponsiveConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ResponsiveConsumerState<ProfilePage> {
  @override
  Widget buildDesktop(BuildContext context, WidgetRef ref) {
    return buildBody(context);
    //   Scaffold(
    //   body: Row(
    //     children: [
    //       AppNavigationRail(),
    //       Expanded(child: buildBody(context)),
    //     ],
    //   ),
    // );
  }

  @override
  Widget buildMobile(BuildContext context, WidgetRef ref) {
    return buildBody(context);
    //   Scaffold(
    //   appBar: buildMobileAppBar(),
    //   endDrawer: buildInfoIcon(context),
    //   body: buildBody(context),
    // );
  }

  @override
  Widget buildTablet(BuildContext context, WidgetRef ref) {
    return buildBody(context);
    // return Scaffold(
    //   appBar: buildAppBar(),
    //   endDrawer: buildInfoIcon(context),
    //   body: buildBody(context),
    // );
  }

  // List<String> routesNames = [
  //   AppRouteName.root,
  //   AppRouteName.career,
  //   AppRouteName.education,
  //   AppRouteName.projects,
  //   AppRouteName.contact,
  // ];

  // int get index {
  //   var location = widget.state.uri.toString();
  //   // Create new location without query parameters
  //   if (location.contains('?')) {
  //     location = location.substring(0, location.indexOf('?'));
  //   }
  //
  //   return routesNames.indexWhere(
  //     (String route) => context.namedLocation(route) == location,
  //   );
  // }

  // List<Widget> buildNav() {
  //   return [
  //     NavigationBar(
  //       selectedIndex: index,
  //       destinations: [
  //         NavigationDestination(icon: Icon(Icons.home),label: "Home"),
  //         NavigationDestination(icon: Icon(Icons.computer),label: "Career"),
  //         NavigationDestination( icon: Icon(Icons.code), label: "Projects"),
  //         NavigationDestination( icon: Icon(Icons.star_border_rounded), label: "Education"),
  //         NavigationDestination( icon: Icon(Icons.email_outlined), label: "Contact")
  //         // TextButton.icon(
  //         //   onPressed: () => context.goNamed(AppRouteName.career),
  //         //   icon: Icon(Icons.computer),
  //         //   label: Text("Career"),
  //         // ),
  //         // TextButton.icon(
  //         //   onPressed: () => context.goNamed(AppRouteName.projects),
  //         //   icon: Icon(Icons.code),
  //         //   label: Text("Projects"),
  //         // ),
  //         // TextButton.icon(
  //         //   onPressed: () => context.goNamed(AppRouteName.education),
  //         //   icon: Icon(Icons.star_border_rounded),
  //         //   label: Text("Education"),
  //         // ),
  //         // TextButton.icon(
  //         //   onPressed: () => context.goNamed(AppRouteName.contact),
  //         //   icon: Icon(Icons.email_outlined),
  //         //   label: Text("Contact"),
  //         // ),
  //       ],
  //     ),
  //   ];
  // }

  // PreferredSizeWidget buildMobileAppBar() {
  //   return AppBar(
  //     elevation: 0.0,
  //     automaticallyImplyLeading: false,
  //     title: RGInitial(),
  //   );
  // }
  //
  // PreferredSizeWidget buildAppBar() {
  //   return AppBar(
  //     elevation: 0.0,
  //     backgroundColor: Colors.white70,
  //     automaticallyImplyLeading: false,
  //     iconTheme: IconThemeData(color: Colors.black),
  //     actions: buildNav(),
  //     title: RGInitial(),
  //   );
  // }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedPadding(
        duration: Duration(seconds: 2),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1 / 2,
            vertical: MediaQuery.of(context).size.height * 0.1 / 1),
        child: ResponsiveWidget(
          largeScreen: Column(
            children: <Widget>[
              // NavHeader(),
              ProfileInfo(),
              SocialInfo(),
              SizedBox(height: 20),
              // ProjectHeaderName(),
              // SizedBox(height: 20),
              // GridViewProjectCards(),
              BuiltResponsiveFlutter()
            ],
          ),
        ),
      ),
    );
  }
}
