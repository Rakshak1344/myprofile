import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';

class NoProjectFoundPage extends ResponsiveStatelessWidget {
  const NoProjectFoundPage({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildNoProjectFoundPage();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildNoProjectFoundPage();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildNoProjectFoundPage();
  }

  Widget buildNoProjectFoundPage() {
    return Center(child: Text("No project found"));
  }
}
