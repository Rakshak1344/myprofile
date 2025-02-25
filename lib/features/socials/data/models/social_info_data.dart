import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/features/socials/data/convertors/icon_data_convertor.dart';

part 'social_info_data.freezed.dart';

part 'social_info_data.g.dart';

@freezed
class SocialInfoData with _$SocialInfoData {
  const factory SocialInfoData({
    required String name,
    @IconDataConverter() required IconData iconData,
    required String url,
  }) = _SocialInfoData;

  factory SocialInfoData.fromJson(Map<String, dynamic> json) =>
      _$SocialInfoDataFromJson(json);

  static List<SocialInfoData> get socialInfoData => <SocialInfoData>[
    SocialInfoData(
      name: "Github",
      iconData: MdiIcons.github,
      url: 'https://github.com/Rakshak1344',
    ),
    SocialInfoData(
      name: "LinkedIn",
      iconData: MdiIcons.linkedin,
      url: 'https://www.linkedin.com/in/rakshith-rakshak-4bb720173/',
    ),
    SocialInfoData(
      name: "Twitter",
      iconData: MdiIcons.twitter,
      url: 'https://twitter.com/Rakshithdev14',
    ),
  ];
}
