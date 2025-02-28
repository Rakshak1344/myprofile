import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:profile/resources/resources.dart';

part 'company_data.freezed.dart';
part 'company_data.g.dart';

@freezed
class CompanyData with _$CompanyData {
  const factory CompanyData({
    required String name,
    required String locatedAt,
    required String startData,
    required String endData,
    required String designatedAs,
    required String logo,
    required String description,
    required String highlights,
    String? url,
  }) = _CompanyData;

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);

  static List<CompanyData> get myCompanyData {
    return <CompanyData>[
      CompanyData(
        name: "Zenya",
        logo: Logos.zenya,
        locatedAt: "Quincy, Massachusetts, USA",
        url: "https://zenya.io",
        startData: "June 2024 ",
        endData: "February 2025",
        designatedAs: "Software Developer",
        description: "Zenya is a cloud-based, all-in-one property management software that empowers property managers and owners to maximize revenue, reduce operational costs, and enhance guest experiences through an integrated platform.",
        highlights: """
Integrated Sentry into frontend and backend applications, identifying and resolving 50% of critical
issues and reducing performance bottlenecks by 30%, resulting in 20% improvement in overall system
stability.\n
Integrated few APIs into frontend web application, enabling seamless data flow and enhancing user
experience and functionality.
          """,
      ),
      CompanyData(
        name: "Indipe",
        logo: Logos.indipe,
        locatedAt: 'Pune, Maharashtra',
        url: "https://indipe.in",
        startData: "February 2023",
        endData: "May 2024",
        designatedAs: "Senior Developer",
        description:
            "IndiPe is one of UPI payments platform with multilingual assistance which provides inclusive financial services, smooth transactions, and innovative solutions for businesses.",
        highlights: """
Incorporated sentry analytics into Indipe Business app to track performance metrics and errors, leading
to 30% decrease in bugs and improved user experience.\n
Designed and implemented mason tools to streamline features, reducing development time by 50% and
increasing overall productivity.\n
Integrated KYC (Know Your Customer) module for investment platform, allowing merchants to invest in
SIP daily or monthly, resulting in 40% increase in user engagement.
          """,
      ),
      CompanyData(
        name: "SuperPay",
        logo: Logos.superpay,
        locatedAt: 'Bengaluru, Karnataka',
        startData: "February 2022",
        endData: "February 2023",
        designatedAs: "Senior Developer",
        description:
            "SuperPay, now part of IndiPe following its acquisition, offering UPI payments experience with services like Super Rewards, budgeting tools, and digital gold investments, making financial management effortless for users.",
        highlights: """
Collaborated with partner team to enhance user experience in SuperPay app by integrating real-time
transaction updates from Unified Payments Interface, resulting in 25% increase in user engagement and
retention.\n
Conceptualized and executed integration of spend category bucket slider into company's mobile app,
resulting in 20% increase in user engagement and 15% decrease in bounce rate.\n
Developed Goal-based money saving prototype app version utilizing NodeJS, MongoDB, and Flutter.
          """,
      ),
      CompanyData(
        name: "Tezsure",
        logo: Logos.tezsure,
        locatedAt: 'Bengaluru, Karnataka',
        startData: "May 2020",
        endData: "November 2024",
        url: "https://tezsure.com/",
        designatedAs: "Flutter Developer Intern",
        description:
            "Tezsure is focused on decentralized finance applications under tezos, building Peer-to-peer transaction network based on blockchain technology.",
        highlights: """
Spearheaded early contributions to the open-source tezster dart package, enabling seamless integration
into the app and reducing code complexity by 40%.\n
Integrated onboarding APIs and streamlined with the tester dart package, resulting in a 50% reduction
in app code, successful beta version release, and enhanced user experience.\n
Contributed to increased Tezos blockchain adoption through proactive engagement with the tezster dart
package, driving efficiency gains and improved functionality for end-users.\n
          """,
      ),
    ];
  }
}
