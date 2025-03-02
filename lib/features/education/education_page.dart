import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/resources/resources.dart';
import 'package:profile/utils/url_launcher_extension.dart';

class EducationPage extends ResponsiveStatelessWidget {
  const EducationPage({super.key});

  final String bacheloreCollegeURL = "https://www.acharya.ac.in/";
  final String mastersCollegeURL = "https://www.theaims.ac.in/";
  final String puCollegeURL = "https://svppu.hkes.edu.in/";
  final String schoolURL = "https://www.stmarys-school.in/";
  final String leftImage =
      "https://images.unsplash.com/photo-1498079022511-d15614cb1c02?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";

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
            image: NetworkImage(leftImage),
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
              Education.aims,
              fit: BoxFit.fill,
            ),
          ),
          title: Text("Master of Computer Applications"),
          subtitle: Text("Acharya Institutes Of Higher education\n2019 - 2021"),
          isThreeLine: true,
          trailing: schoolCollegeLink(mastersCollegeURL),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Image.asset(
              Education.acharya,
              fit: BoxFit.fill,
            ),
          ),
          // leading: CircleAvatar(child: Text("B")),
          title: Text("Bachelor of Computer Application"),
          subtitle: Text("Acharya Institutes Of Graduate Studies\n2016 - 2019"),
          isThreeLine: true,
          trailing: schoolCollegeLink(bacheloreCollegeURL),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Image.asset(
              Education.svpuc,
              fit: BoxFit.fill,
            ),
          ),
          // leading: CircleAvatar(child: Text("P")),
          title: Text("Pre - University"),
          subtitle: Text("Sree veerendra patil pre-university\n2014 - 2016"),
          isThreeLine: true,
          trailing: schoolCollegeLink(puCollegeURL),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Image.asset(
              Education.stMarysConvent,
              fit: BoxFit.fill,
            ),
          ),
          // leading: CircleAvatar(child: Text("S")),
          title: Text("Secondary Education"),
          subtitle: Text("ST. Mary's high school\n2003 - 2014"),
          isThreeLine: true,
          trailing: schoolCollegeLink(schoolURL),
        ),
      ],
    );
  }

  Widget schoolCollegeLink(String? url) {
    return IconButton(
      icon: Icon(Icons.open_in_new),
      onPressed: url.launchURL,
    );
  }

  Widget buildEducationInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TitleAndLine(title: "Education", preTitle: "My"),
          SizedBox(height: 20),
          schoolCollegeColumn(),
        ],
      ),
    );
  }
}
