import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:profile/resources/resources.dart';

part 'project_data.freezed.dart';

part 'project_data.g.dart';

@freezed
class ProjectData with _$ProjectData {
  const factory ProjectData({
    required String name,
    required String slug,
    required String description,
    required String image,
    String? companyLogo,
    String? companyName,
    String? companyUrl,
    String? playStoreUrl,
    String? gitHubUrl,
    String? readmeUrl,
  }) = _ProjectData;

  factory ProjectData.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataFromJson(json);

  static List<ProjectData> get projects => <ProjectData>[
        ProjectData(
          companyLogo: Logos.indipe,
          companyName: "Indipe paytech private limited",
          companyUrl: 'https://indipe.in/',
          name: "Indipe Business",
          slug: "indipe_business",
          image: Projects.indipe,
          description:
              "A business app for small and medium businesses to manage their online payments which were made by the customers",
          playStoreUrl:
              'https://play.google.com/store/apps/details?id=in.indipe.merchant&pcampaignid=web_share',
        ),
      ];
}
