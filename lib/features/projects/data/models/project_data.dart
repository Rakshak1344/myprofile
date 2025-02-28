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
          companyLogo: TechImage.indipe,
          companyName: "Indipe paytech private limited",
          companyUrl: 'https://indipe.in/',
          name: "Indipe Business",
          slug: "indipe_business",
          image: Projects.indipe1,
          description:
              "A business app for small and medium businesses to manage their online payments which were made by the customers",
          playStoreUrl:
              'https://play.google.com/store/apps/details?id=in.indipe.merchant&pcampaignid=web_share',
          images: indipeBusiness,
          techIcons: [MdiIcons.laravel, MdiIcons.firebase],
          techIconAssets: [
            TechImage.flutter,
            TechImage.pgsql,
            TechImage.sentry
          ],
        ),
        ProjectData(
          companyLogo: TechImage.indipe,
          companyName: "Indipe paytech private limited",
          companyUrl: 'https://indipe.in/',
          name: "Indipe",
          slug: "indipe",
          image:
              "https://play-lh.googleusercontent.com/miK4VldhxFpPmQLT9fMYjHv6gibBzoRguicQ2THLoHx86bvUh8AH7QceTCvthJ2t-oNF=w480-h960-rw",
          description:
              "A business app for small and medium businesses to manage their online payments which were made by the customers",
          playStoreUrl:
              'https://play.google.com/store/apps/details?id=in.indipe.merchant&pcampaignid=web_share',
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
    'https://play-lh.googleusercontent.com/CZjT4TGgRedKiJrtrKTigowcJoapdqE-qhgr1IIQ7-UD16nQmObz33eUA8HPWtLViSU=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/lO61mSFDggyZKn6MnXCVu8PvV_J2AlWY716aCvhX18AIwhBGkFRaus6vgo6B2nnfEw=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/leRBz0VGCrI-iZWx4yBKrJDq5G3mK7pRI5QiiqbsEqxS2nsKf7g-pFSrKcViyPF2H8Q=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/kkJ4_wIqaAhYsDRRz4gBIN0iI2WazBmTJMAjS0tHfsmkNFMGorqeCANgSvey2zIatLA=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/qzxUfcFGRdj6t8zgBYMXgWIFZZYc4STo_XO63xhImLIW5hgb9mVGTeLi35RGhNOQLWkc=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/VqFPuzxQYHZJwvupkvHpaP-P5eUqN_n8yyXkbaFW8D4qlg9No_l0-A82YMZ2L_uC2c8E=w5120-h2880-rw'
  ];
  static List<String> indipeBusiness = [
    'https://play-lh.googleusercontent.com/e5AKNANzkbaNjV_fgn6ZXuwkKMJHfaSh4DOYSW2AkUFdkjBd26uaFyw2OJqsGYNPLta9=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/QsQJBMORu_ORg1g6123HYm_KkFAw9lbIm-HcpAlG7WYNaSnq01ZA1PvV_WAn7VbIY8m2=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/Rs7cfIPE_mkwiZhGOUT3-3lel_mrB14ldFMuw3c5ZOwK4HIqzLImEZ1WtY-nhStKVQ=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/J3BU4dClYtiQpzl_VYFsJEVVQ6fRQRZjb3Vqj0iP_w08c01G6mDQtc_1hMWTulR3MmE=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/vC8rzFgc7pTcY0JWUxDqp-Rja9vnuxBzNYxestazP_ulgDiGajMJQ4oGVp0L4dK0hA=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/aDlr7fI9dbMVxajIpo3aQ5X6vMa9BV0SHoZyOa4juAABRq5QBchruOWFYBqnTXlANqs=w5120-h2880-rw',
    'https://play-lh.googleusercontent.com/F0fOoZDOCenxnFI30UxiMO00OIxwJbP_p13_uEDp5BUxhOWI89GGQRH7ivJrDs5LGdA=w5120-h2880-rw'
  ];
}
