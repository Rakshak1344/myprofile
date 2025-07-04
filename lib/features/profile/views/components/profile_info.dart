import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/profile/views/widgets/built_responsive_flutter.dart';
import 'package:profile/features/profile/views/widgets/experience_in.dart';
import 'package:profile/features/profile/views/widgets/my_image.dart';
import 'package:profile/features/profile/views/widgets/my_name.dart';
import 'package:profile/features/profile/views/widgets/resume_button.dart';
import 'package:profile/features/socials/views/social_info.dart';

class ProfileInfo extends ResponsiveStatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const MyImage(),
        profileData(context),
      ],
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildMobileAndTablet(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildMobileAndTablet(context);
  }

  Widget buildMobileAndTablet(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const MyImage(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        profileData(context),
      ],
    );
  }

  Widget profileData(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        hiThereGreeting(context),
        const MyName(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        designation(context),
        experience(context),
        ExperienceIn(),
        const ResumeButton(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const SocialInfo(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const BuiltResponsiveFlutter(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      ],
    );
  }

  Widget experience(context) {
    return Text(
      "3+ Years of Experience.",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget designation(context) {
    return Text(
      "Full Stack Mobile Developer",
      softWrap: true,
      textScaler: const TextScaler.linear(1.5),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget hiThereGreeting(context) {
    return Text(
      "Hi there! Glad to meet you, I'm",
      textScaler: const TextScaler.linear(2),
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}
