import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/features/common/data/convertors/icon_data_convertor.dart';
import 'package:profile/resources/resources.dart';

part 'tech_experience_data.freezed.dart';

part 'tech_experience_data.g.dart';

@freezed
class TechExperienceData with _$TechExperienceData {
  const factory TechExperienceData({
    required String name,
    required String experienceLevel,
    @IconDataConverter() IconData? iconData,
    String? assetUrl,
  }) = _TechExperienceData;

  factory TechExperienceData.fromJson(Map<String, dynamic> json) =>
      _$TechExperienceDataFromJson(json);

  static List<TechExperienceData> get stack => <TechExperienceData>[
        TechExperienceData(
          name: 'Flutter',
          experienceLevel: 'Experienced',
          assetUrl: TechImage.flutter,
        ),
        TechExperienceData(
          name: 'Kotlin',
          experienceLevel: 'Basics',
          iconData: MdiIcons.languageKotlin,
        ),
        TechExperienceData(
          name: 'Python',
          experienceLevel: 'Intermediate',
          iconData: MdiIcons.languagePython,
        ),
        TechExperienceData(
          name: 'NodeJS',
          experienceLevel: 'Intermediate',
          iconData: MdiIcons.nodejs,
        ),
        TechExperienceData(
          name: 'MongoDB',
          experienceLevel: 'Intermediate',
          assetUrl: TechImage.mongoDb,
        ),
        TechExperienceData(
          name: 'Laravel',
          experienceLevel: 'Basics',
          iconData: MdiIcons.laravel,
        ),
        TechExperienceData(
          name: 'Angular',
          experienceLevel: 'Basics',
          iconData: MdiIcons.angular,
        ),
        TechExperienceData(
          name: 'Git',
          experienceLevel: 'Intermediate',
          iconData: MdiIcons.git,
        ),
        TechExperienceData(
          name: 'GitHub Actions',
          experienceLevel: 'Intermediate',
          iconData: MdiIcons.github,
        ),
        TechExperienceData(
          name: 'AWS',
          experienceLevel: 'Intermediate',
          iconData: MdiIcons.aws,
        ),
        TechExperienceData(
          name: 'Docker',
          experienceLevel: 'Basics',
          iconData: MdiIcons.docker,
        ),
        TechExperienceData(
          name: 'Google Cloud',
          experienceLevel: 'Basics',
          iconData: MdiIcons.googleCloud,
        ),
        TechExperienceData(
          name: 'Google Play',
          experienceLevel: 'Basics',
          iconData: MdiIcons.googlePlay,
        ),
        TechExperienceData(
          name: 'Material Design',
          experienceLevel: 'Intermediate',
          iconData: MdiIcons.materialDesign,
        ),
        TechExperienceData(
          name: 'Sentry',
          experienceLevel: 'Intermediate',
          assetUrl: TechImage.sentry,
        ),
      ];
}
