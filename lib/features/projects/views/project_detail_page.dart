import 'package:flutter/material.dart';

import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';

class ProjectDetailPage extends ResponsiveStatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildProjectDetailPage();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildProjectDetailPage();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildProjectDetailPage();
  }

  Widget buildProjectDetailPage() {
    return Container();
  }
}
