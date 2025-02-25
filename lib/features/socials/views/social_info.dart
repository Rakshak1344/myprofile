import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/header/views/nav_button.dart';
import 'package:profile/features/socials/data/models/social_info_data.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialInfo extends ResponsiveStatelessWidget {
  @override
  Widget buildDesktop(BuildContext context) {
    return buildLargeScreen(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildSmallScreen(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildSmallScreen(context);
  }

  List<Widget> socialNavButtons() {
    return SocialInfoData.socialInfoData.map(
      (e) {
        return NavButton(
          text: e.name,
          icon: e.iconData,
          onPressed: () async {
            final Uri _url = Uri.parse(e.url);
            if (!await launchUrl(_url)) {
              throw Exception('Could not launch $_url');
            }
          },
          color: Colors.blue,
          iconColor: Colors.red,
        );
      },
    ).toList();
  }

  Widget buildSmallScreen(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialNavButtons(),
    );
  }

  Widget buildLargeScreen(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: socialNavButtons(),
    );
  }

  Widget buildHorizontalLine(BuildContext context) {
    return Container(
      height: 1.5,
      width: MediaQuery.of(context).size.width,
      color: Colors.black45,
    );
  }
}
