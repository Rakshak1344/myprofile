import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';

class ExperienceIn extends ResponsiveStatelessWidget {
  ExperienceIn({super.key});

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
            child: Center(
              child: AnimatedTextKit(
                totalRepeatCount: 10,
                isRepeatingAnimation: true,
                repeatForever: true,
                animatedTexts:
                    text.map((e) => animatedText(context, e)).toList(),

                // text: [
                //   "Flutter.",
                //   "Material UI.",
                //   "JavaScript.",
                //   "Node.js.",
                //   "MongoDB Atlas.",
                //   "Firebase.",
                //   "Laravel.",
                //   "PostgreSQL.",
                //   "Linux.",
                //   "Google Maps API.",
                //   "AWS S3.",
                //   "AWS EC2",
                //   "Heroku",
                //   "AdobeXD"
                // ],
                // textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                //       fontWeight: FontWeight.w600,
                //       color: Theme.of(context).colorScheme.primary,
                //     ),
                // textAlign: TextAlign.center,
                // alignment: AlignmentDirectional.center // or Alignment.topLeft
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<String> text = [
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
    "AWS EC2.",
    "Heroku.",
    "AdobeXD."
  ];

  AnimatedText animatedText(context, String text) {
    return TypewriterAnimatedText(
      text,
      textAlign: TextAlign.center,
      textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.secondary,
          ),
    );
  }
}
