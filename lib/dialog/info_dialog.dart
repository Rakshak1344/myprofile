import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/resources/resources.dart';
import '../arch/view/responsive_view.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Widget schoolCollegeLink(url) {
    return IconButton(
      icon: Icon(Icons.open_in_new),
      onPressed: () async {
        await canLaunch(url)
            ? await launch(url)
            : throw 'Could not launch $url';
      },
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

class InfoDialog extends StatelessWidget {
  String bacheloreCollegeURL = "https://www.acharya.ac.in/";
  String mastersCollegeURL = "https://www.theaims.ac.in/";
  String puCollegeURL = "https://svppu.hkes.edu.in/";
  String schoolURL = "https://www.stmarys-school.in/";
  String leftImage =
      "https://images.unsplash.com/photo-1498079022511-d15614cb1c02?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(leftImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.grade),
                        line(context),
                        schoolCollegeColumn(),
                        line(context),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Thank You for viewing my profile",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 4,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildEducationPlaceholderImage(),
                  ),
                  Expanded(
                    child: buildEducationInfo(context),
                  )
                ],
              ),
            ),
          );
  }

  Column buildEducationInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.grade),
        line(context),
        schoolCollegeColumn(),
        line(context),
        SizedBox(
          height: 10,
        ),
        Text(
          "Thank You for viewing my profile",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildEducationPlaceholderImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        image: DecorationImage(
          image: NetworkImage(leftImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget line(context) {
    return Container(
      color: Colors.black,
      height: 1.5,
      width: MediaQuery.of(context).size.width * 0.1,
    );
  }

  Widget schoolCollegeColumn() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(child: Text("M")),
          title: Text("Master of Computer Applications"),
          subtitle:
              Text("Acharya Institutes Of Higher education\n2019 - Present"),
          isThreeLine: true,
          trailing: schoolCollegeLink(mastersCollegeURL),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Text("B"),
            backgroundColor: Colors.red,
          ),
          title: Text("Bachelor of Computer Application"),
          subtitle: Text("Acharya Institutes Of Graduate Studies\n2016 - 2019"),
          isThreeLine: true,
          trailing: schoolCollegeLink(bacheloreCollegeURL),
        ),
        ListTile(
          leading: CircleAvatar(child: Text("P")),
          title: Text("Pre - University"),
          subtitle: Text("Sree veerendra patil pre-university\n2014 - 2016"),
          isThreeLine: true,
          trailing: schoolCollegeLink(puCollegeURL),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Text("S"),
            backgroundColor: Colors.red,
          ),
          title: Text("Secondary Education"),
          subtitle: Text("ST. Mary's high school\n2003 - 2014"),
          isThreeLine: true,
          trailing: schoolCollegeLink(schoolURL),
        ),
      ],
    );
  }

  Widget schoolCollegeLink(url) {
    return IconButton(
      icon: Icon(
        Icons.open_in_new,
        color: Colors.red,
      ),
      onPressed: () async {
        await canLaunch(url)
            ? await launch(url)
            : throw 'Could not launch $url';
      },
    );
  }
}
