import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';

class ExperienceIn extends ResponsiveStatelessWidget {
  const ExperienceIn({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return experienceIn(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return experienceIn(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return experienceIn(context);
  }

  Widget experienceIn(context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Experience In  ",
            softWrap: true,
            textScaler: TextScaler.linear(1.5),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 100,
            width: 120,
            child: RotateAnimatedTextKit(
                totalRepeatCount: 10,
                text: [
                  "Flutter.",
                  "Material UI.",
                  "JavaScript.",
                  "Node.js.",
                  "MongoDB Atlas.",
                  "Firebase.",
                  "Laravel.",
                  "PostgreSQL.",
                  "Linux.",
                  "Google Maps API.",
                  "AWS S3.",
                  "AWS EC2",
                  "Heroku",
                  "AdobeXD"
                ],
                textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                textAlign: TextAlign.center,
                alignment: AlignmentDirectional.center // or Alignment.topLeft
                ),
          ),
        ],
      ),
    );
  }
}
