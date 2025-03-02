import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/projects/views/widgets/experiments_widgets.dart';
import 'package:profile/features/projects/views/widgets/projects_list_widget.dart';

class ProjectsPage extends ResponsiveStatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildProjectsPage(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildProjectsPage(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildProjectsPage(context);
  }

  Widget buildProjectsPage(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 32),
          ProjectsListWidget(),
          SizedBox(height: 32),
          ExperimentsListWidget(),
        ],
      ),
    );
  }
}
