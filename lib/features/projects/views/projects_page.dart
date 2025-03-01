import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/features/profile/views/widgets/horizontal_line.dart';
import 'package:profile/features/projects/data/models/project_data.dart';
import 'package:profile/features/projects/views/widgets/experiments_widgets.dart';
import 'package:profile/features/projects/views/widgets/projects_list_widget.dart';
import 'package:profile/features/projects/views/widgets/readmore_button.dart';
import 'package:profile/features/projects/views/widgets/url_button.dart';
import 'package:profile/navigation/routes/app_route_name.dart';
import 'package:profile/resources/resources.dart';

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
