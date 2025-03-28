import 'package:flutter/material.dart';
import 'package:profile/arch/config/links.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/resources/resources.dart';
import 'package:profile/utils/url_launcher_extension.dart';

class EducationPage extends ResponsiveStatelessWidget {
  const EducationPage({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return buildEducationPage();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 160, child: buildEducationPlaceholderImage()),
        Expanded(child: buildEducationInfo()),
      ],
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildEducationPage();
  }

  Widget buildEducationPage() {
    return Row(
      children: [
        Expanded(child: buildEducationPlaceholderImage()),
        Expanded(child: buildEducationInfo()),
      ],
    );
  }

  Widget buildEducationPlaceholderImage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(Links.education.placeholder),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget schoolCollegeColumn() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            child: Image.asset(
              EducationImage.aims,
              fit: BoxFit.fill,
            ),
          ),
          title: const Text("Master of Computer Applications"),
          subtitle: const Text("Acharya Institutes Of Higher education\n2019 - 2021"),
          isThreeLine: true,
          trailing: schoolCollegeLink(Links.education.masters),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Image.asset(
              EducationImage.acharya,
              fit: BoxFit.fill,
            ),
          ),
          // leading: CircleAvatar(child: Text("B")),
          title: const Text("Bachelor of Computer Application"),
          subtitle: const Text("Acharya Institutes Of Graduate Studies\n2016 - 2019"),
          isThreeLine: true,
          trailing: schoolCollegeLink(Links.education.bachelors),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Image.asset(
              EducationImage.svpuc,
              fit: BoxFit.fill,
            ),
          ),
          // leading: CircleAvatar(child: Text("P")),
          title: const Text("Pre - University"),
          subtitle: const Text("Sree veerendra patil pre-university\n2014 - 2016"),
          isThreeLine: true,
          trailing: schoolCollegeLink(Links.education.pu),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Image.asset(
              EducationImage.stMarysConvent,
              fit: BoxFit.fill,
            ),
          ),
          // leading: CircleAvatar(child: Text("S")),
          title: const Text("Secondary Education"),
          subtitle: const Text("ST. Mary's high school\n2003 - 2014"),
          isThreeLine: true,
          trailing: schoolCollegeLink(Links.education.school),
        ),
      ],
    );
  }

  Widget schoolCollegeLink(String? url) {
    return IconButton(
      icon: const Icon(Icons.open_in_new),
      onPressed: url.launchURL,
    );
  }

  Widget buildEducationInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const TitleAndLine(title: "Education", preTitle: "My"),
          const SizedBox(height: 20),
          schoolCollegeColumn(),
        ],
      ),
    );
  }
}
