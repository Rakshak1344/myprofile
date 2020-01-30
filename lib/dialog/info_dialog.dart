import 'package:flutter/material.dart';
import '../responsive_view.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String bacheloreCollegeURL =
        "https://acharya.ac.in/acharya-institute-of-graduate-studies-courses?dept=Bachelor%20Of%20Computer%20Application";
    String mastersCollegeURL =
        "https://theaims.ac.in/mca-college-bangalore.html";
    String puCollegeURL = "http://svppu.hkes.edu.in/load?menu=m08&page=courses";
    String schoolURL = "http://www.stmarys-school.in/smc/#";
    String leftImage =
        "https://images.unsplash.com/photo-1498079022511-d15614cb1c02?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
    Widget schoolCollegeLink(url) => IconButton(
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
    Widget schoolCollegeColumn() => Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(child: Text("M")),
              title: Text("Master of Computer Applications"),
              subtitle: Text(
                  "Acharya Institutes Of Higher education\n2019 - Present"),
              isThreeLine: true,
              trailing: schoolCollegeLink(mastersCollegeURL),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text("B"),
                backgroundColor: Colors.red,
              ),
              title: Text("Bachelor of Computer Application"),
              subtitle:
                  Text("Acharya Institutes Of Graduate Studies\n2016 - 2019"),
              isThreeLine: true,
              trailing: schoolCollegeLink(bacheloreCollegeURL),
            ),
            ListTile(
              leading: CircleAvatar(child: Text("P")),
              title: Text("Pre - University"),
              subtitle:
                  Text("Sree veerendra patil pre-university\n2014 - 2016"),
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
    Widget line() => Container(
          color: Colors.black,
          height: 1.5,
          width: MediaQuery.of(context).size.width * 0.1,
        );
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // elevation: 14,
      insetAnimationCurve: Curves.easeIn,
      insetAnimationDuration: Duration(seconds: 3),
      child: ResponsiveWidget.isSmallScreen(context)
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
                          image: NetworkImage(
                            leftImage,
                          ),
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
                          line(),
                          schoolCollegeColumn(),
                          line(),
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
                      child: Container(
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
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.grade),
                          line(),
                          schoolCollegeColumn(),
                          line(),
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
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
