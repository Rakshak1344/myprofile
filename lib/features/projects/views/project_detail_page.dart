import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/projects/data/models/project_data.dart';

class ProjectDetailPage extends ResponsiveStatelessWidget {
  final ProjectData projectData;

  const ProjectDetailPage({super.key, required this.projectData});

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
    return Container(
      child: Center(child: Text(projectData.name)),
    );
  }
}
