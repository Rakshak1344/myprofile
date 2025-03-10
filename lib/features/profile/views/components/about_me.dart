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
        const TitleAndLine(preTitle: "Get to know more", title: "About Me."),
        const SizedBox(height: 20),
        buildCareer(),
        const SizedBox(height: 20),
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
        const TitleAndLine(preTitle: "Get to know more", title: "About Me."),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: buildCareer()),
            const SizedBox(width: 20),
            Expanded(child: buildEducation()),
          ],
        ),
      ],
    );
  }

  Widget buildAboutMeDesktop() {
    return Column(
      children: [
        const TitleAndLine(preTitle: "Get to know more", title: "About Me."),
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 80),
            Expanded(child: buildCareer()),
            const SizedBox(width: 20),
            Expanded(child: buildEducation()),
            const SizedBox(width: 80),
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
          'My academic background has equipped me with a strong foundation in software engineering, system design, and cloud technologies, enabling me to build high-performance applications that drive innovation.',
      navigateTo: AppRouteName.education,
      images: const [
        EducationImage.aims,
        EducationImage.acharya,
        EducationImage.svpuc,
        EducationImage.stMarysConvent
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
          'I thrive on building technology end-to-end, with a deep passion for mobile and backend development. My expertise lies in crafting scalable, high-performance applications that deliver seamless user experiences.',
      images: logos,
      navigateTo: AppRouteName.career,
    );
  }
}
