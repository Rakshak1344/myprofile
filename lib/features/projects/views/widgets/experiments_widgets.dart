import 'package:flutter/material.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/features/projects/data/models/project_data.dart';
import 'package:profile/features/projects/views/widgets/readmore_button.dart';
import 'package:profile/navigation/routes/app_route_name.dart';
import 'package:profile/resources/resources.dart';
import 'package:go_router/go_router.dart';

class ExperimentsListWidget extends ResponsiveStatelessWidget {
  const ExperimentsListWidget({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildExperimentsPage(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: buildExperimentsPage(context),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildExperimentsPage(context);
  }

  Widget buildExperimentsPage(context) {
    return Column(
      children: [
        TitleAndLine(title: "Experiments", preTitle: "My"),
        SizedBox(height: 20),
        ...List.generate(ProjectData.experiments.length, (i) {
          return buildListTile(ProjectData.experiments[i]);
        }).toList(),
      ],
    );
  }

  Container buildListTile(ProjectData projectData) {
    return Container(
      width: 900,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: () {
          AppConfig.navigatorKey.currentContext?.goNamed(
            AppRouteName.projectDetails,
            pathParameters: {'slug': projectData.slug},
          );
        },
        leading: Image.asset(TechImage.flutter),
        title: Text(projectData.name),
        subtitle: Text(projectData.description),
        trailing: ReadmoreButton(slug: projectData.slug),
      ),
    );
  }
}
