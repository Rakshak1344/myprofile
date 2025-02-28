import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/features/profile/views/widgets/career_info.dart';
import 'package:profile/navigation/routes/app_route_name.dart';
import 'package:profile/resources/resources.dart';

class AboutMe extends ResponsiveStatelessWidget {
  const AboutMe({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildAboutMeDesktop();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Column(
      children: [
        TitleAndLine(preTitle: "Get to know more", title: "About Me."),
        SizedBox(height: 20),
        buildCareer(),
        SizedBox(height: 20),
        buildEducation(),
      ],
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildAboutMe();
  }

  Widget buildAboutMe() {
    return Column(
      children: [
        TitleAndLine(preTitle: "Get to know more", title: "About Me."),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: buildCareer()),
            SizedBox(width: 20),
            Expanded(child: buildEducation()),
          ],
        ),
      ],
    );
  }

  Widget buildAboutMeDesktop() {
    return Column(
      children: [
        TitleAndLine(preTitle: "Get to know more", title: "About Me."),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 80),
            Expanded(child: buildCareer()),
            SizedBox(width: 20),
            Expanded(child: buildEducation()),
            SizedBox(width: 80),
          ],
        ),
      ],
    );
  }

  Widget buildEducation() {
    return CareerInfo(
      title: "Education",
      subtitle:
          "BCA - Bachelor of Computer Applications\nMCA - Master of Computer Applications",
      iconData: MdiIcons.bookEducation,
      description:
          'This is a brief description about the companies represented by the logos above. These companies have collaborated on various projects and have a strong presence in the industry.',
      navigateTo: AppRouteName.education,
      images: [
        Education.aims,
        Education.acharya,
        Education.svpuc,
        Education.stMarysConvent
      ],
    );
  }

  Widget buildCareer() {
    final List<String> logos = [
      Logos.zenya,
      Logos.indipe,
      Logos.superpay,
      Logos.tezsure,
    ];
    return CareerInfo(
      title: "Experience",
      subtitle: "3+ Years\nSenior Developer",
      iconData: MdiIcons.codeTags,
      description:
          'This is a brief description about the companies represented by the logos above. These companies have collaborated on various projects and have a strong presence in the industry.',
      images: logos,
      navigateTo: AppRouteName.career,
    );
  }
}
