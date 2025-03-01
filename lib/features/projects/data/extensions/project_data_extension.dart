import 'package:collection/collection.dart';
import 'package:profile/features/projects/data/models/project_data.dart';

extension ProjectDataExtension on String {
  /// Using slug to get project data
  ProjectData? get getProjectData => [
        ...ProjectData.projects,
        ...ProjectData.experiments
      ].firstWhereOrNull((element) => element.slug == this);
}
