import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/features/projects/data/models/project_data.dart';
import 'package:profile/features/projects/views/widgets/readmore_button.dart';
import 'package:profile/features/projects/views/widgets/url_button.dart';

class ProjectsListWidget extends ResponsiveStatelessWidget {
  final bool isPreview;

  const ProjectsListWidget({super.key, this.isPreview = false});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildProjectsListWidget(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildProjectsListWidget(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildProjectsListWidget(context);
  }

  Widget buildProjectsListWidget(context) {
    var projects =
        isPreview ? ProjectData.projects.sublist(0, 2) : ProjectData.projects;

    return Column(
      children: [
        TitleAndLine(
          title: "Projects",
          preTitle: isPreview ? "Recent" : "Worked on these",
        ),
        const SizedBox(height: 20),
        Wrap(
          runSpacing: 20,
          spacing: 20,
          children: List.generate(projects.length, (i) {
            return buildProjectCard(context, projects[i]);
          }),
        ),
      ],
    );
  }

  Widget buildProjectCard(context, ProjectData p) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
            p.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(p.image!, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              if (p.playStoreUrl != null) ...[
                Expanded(child: UrlButton(url: p.playStoreUrl!)),
                const SizedBox(width: 12),
              ],
              if (p.pubDevUrl != null) ...[
                Expanded(child: UrlButton(url: p.pubDevUrl!)),
                const SizedBox(width: 12),
              ],
              Expanded(child: ReadmoreButton(slug: p.slug)),
            ],
          ),
          const SizedBox(height: 22)
        ],
      ),
    );
  }
}
