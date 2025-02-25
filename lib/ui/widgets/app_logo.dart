import 'package:flutter/material.dart';
import 'package:profile/resources/resources.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.isDark = false,
    this.height = 44,
    this.width = 44,
  });

  final bool isDark;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isDark ? Logos.r : Logos.r,
      height: height,
      width: width,
      package: 'core',
    );
  }
}
