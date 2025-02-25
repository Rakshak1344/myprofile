import 'package:flutter/material.dart';
import 'package:profile/arch/view/responsive_mixin.dart';

abstract class ResponsiveStatefulWidget extends StatefulWidget {
  const ResponsiveStatefulWidget({Key? key}) : super(key: key);

  @override
  ResponsiveState createState();
}

abstract class ResponsiveState<T extends ResponsiveStatefulWidget>
    extends State<T> with ResponsiveMixin {
  /// Override this for mobile layout
  Widget buildMobile(BuildContext context);

  /// Override this for tablet layout
  Widget buildTablet(BuildContext context);

  /// Override this for desktop layout
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
