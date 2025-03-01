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
    String? image,
    List<String>? images,
    @IconDataConverter() List<IconData>? techIcons,
    List<String>? techIconAssets,
    String? companyLogo,
    String? companyName,
    String? companyUrl,
    String? playStoreUrl,
    String? gitHubUrl,
    String? pubDevUrl,
    String? readmeContentOrLink,
  }) = _ProjectData;

  factory ProjectData.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataFromJson(json);

  static List<ProjectData> get projects => <ProjectData>[
        _indipeBusiness,
        _indipeConsumer,
        _tezsure,
      ];

  static List<ProjectData> get experiments => <ProjectData>[
        driftIsolate,
      ];

  static ProjectData driftIsolate = ProjectData(
    name: "Multi Drift Isolate",
    slug: "multi_drift_isolate",
    description:
        "Stream Data at once to UI through Multi-DriftIsolate-Database",
    gitHubUrl: "https://github.com/Rakshak1344/Driftic",
    readmeContentOrLink:
        "https://raw.githubusercontent.com/Rakshak1344/Driftic/refs/heads/dev/README.md",
    techIconAssets: [TechImage.flutter],
  );

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
    readmeContentOrLink:
        '${ReadmeData.indipeBusiness}\n\n${ReadmeData.flutterArchitecture}',
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
    readmeContentOrLink:
        '${ReadmeData.indipeConsumer}\n\n${ReadmeData.flutterArchitecture}',
    images: ProjectAppScreenshotList.indipeConsumerScreenshots,
    techIcons: [MdiIcons.laravel, MdiIcons.firebase],
    techIconAssets: [TechImage.flutter, TechImage.pgsql, TechImage.sentry],
  );

  static var _tezsure = ProjectData(
    companyLogo: Logos.tezsure,
    companyName: "Tezsure",
    companyUrl: 'https://tezsure.com/',
    name: "Tezster dart",
    slug: "tezsure",
    image: Logos.tezsure,
    description:
        "Tezster_dart is a toolkit that helps developers create applications on the Tezos blockchain using Flutter. It offers features like wallet management, balance checks, and transaction processing, simplifying the development of blockchain-based apps",
    readmeContentOrLink:
        'https://raw.githubusercontent.com/Tezsure/Tezster_dart/refs/heads/master/README.md',
    gitHubUrl: 'https://github.com/Tezsure/tezster_dart',
    pubDevUrl: 'https://pub.dev/packages/tezster_dart',
    images: [Logos.tezsure],
    techIconAssets: [TechImage.dart],
  );
}
