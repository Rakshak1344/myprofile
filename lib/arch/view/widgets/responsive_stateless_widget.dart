import 'package:profile/arch/view/responsive_mixin.dart';
import 'package:flutter/material.dart';

abstract class ResponsiveStatelessWidget extends StatelessWidget
    with ResponsiveMixin {
  const ResponsiveStatelessWidget({Key? key}) : super(key: key);

  Widget buildMobile(BuildContext context);

  Widget buildTablet(BuildContext context);

  Widget buildDesktop(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildResponsive(
      context: context,
      buildMobile: () => buildMobile(context),
      buildTablet: () => buildTablet(context),
      buildDesktop: () => buildDesktop(context),
    );
  }
}
