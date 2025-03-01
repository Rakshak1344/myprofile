import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/features/common/data/convertors/icon_data_convertor.dart';
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
          image: Projects.indipeBusinessAppLogo,
          description:
              "A business app for small and medium businesses to manage their online payments which were made by the customers",
          playStoreUrl:
              'https://play.google.com/store/apps/details?id=in.indipe.merchant&pcampaignid=web_share',
          readmeUrl: "https://raw.githubusercontent.com/Rakshak1344/Driftic/refs/heads/dev/README.md",
          images: indipeBusiness,
          techIcons: [MdiIcons.laravel, MdiIcons.firebase],
          techIconAssets: [
            TechImage.flutter,
            TechImage.pgsql,
            TechImage.sentry
          ],
        ),
        ProjectData(
          companyLogo: Logos.indipe,
          companyName: "Indipe paytech private limited",
          companyUrl: 'https://indipe.in/',
          name: "Indipe",
          slug: "indipe",
          image: Projects.indipeConsumerAppLogo,
          // image:
          //     "https://play-lh.googleusercontent.com/miK4VldhxFpPmQLT9fMYjHv6gibBzoRguicQ2THLoHx86bvUh8AH7QceTCvthJ2t-oNF=w480-h960-rw",
          description:
              "A business app for small and medium businesses to manage their online payments which were made by the customers",
          playStoreUrl:
              'https://play.google.com/store/apps/details?id=in.indipe.merchant&pcampaignid=web_share',
          readmeUrl: "https://raw.githubusercontent.com/Rakshak1344/Driftic/refs/heads/dev/README.md",
          images: indipeConsumer,
          techIcons: [MdiIcons.laravel, MdiIcons.firebase],
          techIconAssets: [
            TechImage.flutter,
            TechImage.pgsql,
            TechImage.sentry
          ],
        ),
      ];

  static List<String> indipeConsumer = [
    Projects.indipeConsumer1,
    Projects.indipeConsumer2,
    Projects.indipeConsumer3,
    Projects.indipeConsumer4,
    Projects.indipeConsumer5,
  ];
  static List<String> indipeBusiness = [
    Projects.indipeBusiness1,
    Projects.indipeBusiness2,
    Projects.indipeBusiness3,
    Projects.indipeBusiness4,
    Projects.indipeBusiness5,
  ];
}
