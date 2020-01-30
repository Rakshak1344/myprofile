import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'responsive_view.dart';
import 'package:url_launcher/url_launcher.dart';

final resumeURL =
    "https://drive.google.com/file/d/1hdvW6dJhQcnc-8DRqUF4qFLRcR7L9Bw4/view";

class ProfileInfo extends StatelessWidget {
  void customLaunchURL(urlCommand) async {
    if (await canLaunch(urlCommand)) {
      await launch(urlCommand);
    } else {
      print("Could not launch $urlCommand ");
    }
  }

  Widget myResume() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.open_in_browser,
            color: Colors.white,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            "Resume",
            style: TextStyle(color: Colors.white, letterSpacing: 1),
          ),
        ],
      );

  Widget allIcons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "{",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.red, fontSize: 40),
          ),
          Icon(MdiIcons.coffee),
          Icon(MdiIcons.desktopClassic),
          Icon(MdiIcons.keyboard),
          Icon(MdiIcons.cellphoneIphone),
          Icon(Icons.flight),
          Text(
            "}",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.red, fontSize: 40),
          )
        ],
      );

  Widget experienceIn() => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Experience In  ",
              softWrap: true,
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 100,
              width: 120,
              child: RotateAnimatedTextKit(
                  totalRepeatCount: 10,
                  text: [
                    "HTML.",
                    "CSS.",
                    "JavaScript.",
                    "Linux",
                    "Flutter.",
                    "Node.js.",
                    "MongoDB.",
                    "Google Cloud.",
                    "MongoDB Atlas.",
                    "Firebase.",
                    "Heroku",
                    "AdobeXD"
                  ],
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: "Horizon",
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                  alignment: AlignmentDirectional.center // or Alignment.topLeft
                  ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    double nameTextSize = ResponsiveWidget.isSmallScreen(context) ? 8 : 12;

    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileImage(context),
          profileData(context, nameTextSize),
        ],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData(context, nameTextSize),
        ],
      ),
    );
  }

  profileImage(context) => AnimatedContainer(
        duration: Duration(seconds: 2),
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.deepOrange,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
              "https://pbs.twimg.com/profile_images/1146055708569292800/DaVWnQm3_400x400.jpg",
            ),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  profileData(context, nameTextSize) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Hi there! My name is",
            textScaleFactor: 2,
            style: TextStyle(color: Colors.blueGrey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Rakshith G",
                textScaleFactor: 5,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: nameTextSize,
                ),
              ),
              Text(
                ".",
                textScaleFactor: 5,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: nameTextSize,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "I'm a Full Stack Developer.\n"
              "A design is a art that I Live-In.\n"
              "I { code } the art to Soul-In the design\n"
              "Building apps drives me crazy.\n"
              "A new day, new experience.",
              softWrap: true,
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          experienceIn(),
          SizedBox(
            height: 20,
          ),
          ResponsiveWidget.isSmallScreen(context)
              ? Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        splashColor: Colors.black,
                        child: myResume(),
                        color: Colors.red,
                        onPressed: () {
                          customLaunchURL(resumeURL);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    allIcons(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40,
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        splashColor: Colors.black,
                        child: myResume(),
                        color: Colors.red,
                        onPressed: () {
                          customLaunchURL(resumeURL);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    allIcons()
                  ],
                )
        ],
      );
}
