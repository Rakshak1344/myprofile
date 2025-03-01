import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/features/projects/data/models/project_data.dart';
import 'package:profile/features/projects/views/widgets/url_button.dart';
import 'package:profile/navigation/routes/app_route_name.dart';

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
          TitleAndLine(title: "Projects", preTitle: "Worked on these"),
          SizedBox(height: 20),
          Wrap(
            runSpacing: 20,
            spacing: 20,
            children: List.generate(ProjectData.projects.length, (i) {
              return buildProjectCard(context, ProjectData.projects[i]);
            }),
          ),
        ],
      ),
    );
  }

  Widget buildProjectCard(context, ProjectData p) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Text(
            p.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            height: 200,
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(p.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 22),
          Row(
            children: [
              if (p.playStoreUrl != null) ...[
                Expanded(child: UrlButton(url: p.playStoreUrl!)),
                SizedBox(width: 12),
              ],
              if (p.pubDevUrl != null) ...[
                Expanded(child: UrlButton(url: p.pubDevUrl!)),
                SizedBox(width: 12),
              ],
              Expanded(child: buildReadMoreButton(p.slug, context)),
            ],
          ),
          SizedBox(height: 22)
        ],
      ),
    );
  }

  Widget buildReadMoreButton(String slug, context) {
    return OutlinedButton.icon(
      label: Text("Read more", style: Theme.of(context).textTheme.bodySmall),
      icon: Icon(Icons.read_more_rounded),
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            visualDensity: VisualDensity.compact,
          ),
      onPressed: () {
        AppConfig.navigatorKey.currentContext?.goNamed(
          AppRouteName.projectDetails,
          pathParameters: {'slug': slug},
        );
      },
    );
  }
}
