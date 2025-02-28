import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:profile/features/projects/data/models/project_data.dart';
import 'package:profile/features/projects/views/no_project_found_page.dart';
import 'package:profile/features/projects/views/project_detail_page.dart';

class ProjectPage extends StatelessWidget {
  final String slug;
  final ProjectData? project;

  ProjectPage({super.key, required this.slug})
      : project = ProjectData.projects
            .firstWhereOrNull((element) => element.slug == slug);

  @override
  Widget build(BuildContext context) {
    if (project == null) {
      return NoProjectFoundPage();
    }

    return ProjectDetailPage(projectData: project!);
  }
}
