import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/features/common/data/convertors/icon_data_convertor.dart';
import 'package:profile/features/projects/data/models/project_app_screenshots.dart';
import 'package:profile/features/projects/data/models/readme_data.dart';
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
    required List<String> images,
    @IconDataConverter() List<IconData>? techIcons,
    List<String>? techIconAssets,
    String? companyLogo,
    String? companyName,
    String? companyUrl,
    String? playStoreUrl,
    String? gitHubUrl,
    String? readmeContentOrLink,
  }) = _ProjectData;

  factory ProjectData.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataFromJson(json);

  static List<ProjectData> get projects => <ProjectData>[
        _indipeBusiness,
        _indipeConsumer,
      ];

  static ProjectData _indipeBusiness = ProjectData(
    companyLogo: Logos.indipe,
    companyName: "Indipe paytech private limited",
    companyUrl: 'https://indipe.in/',
    name: "Indipe Business",
    slug: "indipe_business",
    image: Projects.indipeBusinessAppLogo,
    description:
        "The IndiPe Business app is a comprehensive payment solution tailored for merchants in India, offering a one-stop platform to manage transactions efficiently.",
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=in.indipe.merchant&pcampaignid=web_share',
    readmeContentOrLink: ReadmeData.flutterArchitecture,
    // readmeContentOrLink:
    //     "https://raw.githubusercontent.com/Rakshak1344/Driftic/refs/heads/dev/README.md",
    images: ProjectAppScreenshotList.indipeBusinessScreenshots,
    techIcons: [MdiIcons.laravel, MdiIcons.firebase],
    techIconAssets: [TechImage.flutter, TechImage.pgsql, TechImage.sentry],
  );

  static var _indipeConsumer = ProjectData(
    companyLogo: Logos.indipe,
    companyName: "Indipe paytech private limited",
    companyUrl: 'https://indipe.in/',
    name: "Indipe",
    slug: "indipe",
    image: Projects.indipeConsumerAppLogo,
    description:
        "Indipe is a secure and user-friendly UPI app designed for seamless payments, and to help users take control of their finances. It seamlessly combines budgeting, investment, and payment features to enhance financial well-being and mindful spending.",
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=in.indipe.merchant&pcampaignid=web_share',
    readmeContentOrLink: ReadmeData.flutterArchitecture,
    images: ProjectAppScreenshotList.indipeConsumerScreenshots,
    techIcons: [MdiIcons.laravel, MdiIcons.firebase],
    techIconAssets: [TechImage.flutter, TechImage.pgsql, TechImage.sentry],
  );
}
