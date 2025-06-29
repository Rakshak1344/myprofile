import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/arch/config/links.dart';

part 'social_info_data.freezed.dart';

@freezed
class SocialInfoData with _$SocialInfoData {
  const factory SocialInfoData({
    required String name,
    required IconData iconData,
    required String url,
  }) = _SocialInfoData;

  static List<SocialInfoData> get socialInfoData => <SocialInfoData>[
        SocialInfoData(
          name: "Github",
          iconData: MdiIcons.github,
          url: Links.my.github,
        ),
        SocialInfoData(
          name: "LinkedIn",
          iconData: MdiIcons.linkedin,
          url: Links.my.linkedIn,
        ),
        SocialInfoData(
          name: "Twitter",
          iconData: MdiIcons.twitter,
          url: Links.my.twitter,
        ),
      ];
}
