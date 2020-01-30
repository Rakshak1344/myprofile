import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'nav_button.dart';
import 'responsive_view.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget horizontalLine() => Container(
          height: 1.5,
          width: MediaQuery.of(context).size.width,
          color: Colors.black45,
        );
    String gitHubURL = "https://github.com/Rakshak1344";
    String twitterURL = "https://twitter.com/Rakshithdev14";
    String facebookURL = "https://www.facebook.com/rakshith.gajendra";
    String linkedInURL =
        "https://www.linkedin.com/in/rakshith-rakshak-4bb720173/";

    List<Widget> socialNavButtons() => [
          NavButton(
            text: "Github",
            icon: MdiIcons.githubBox,
            onPressed: () async {
              await canLaunch(gitHubURL)
                  ? await launch(gitHubURL)
                  : throw 'Could not launch $gitHubURL';
            },
            color: Colors.blue,
            iconColor: Colors.red,
          ),
          NavButton(
            text: "LinkedIn",
            icon: MdiIcons.linkedin,
            onPressed: () async {
              await canLaunch(linkedInURL)
                  ? await launch(linkedInURL)
                  : throw 'Could not launch $linkedInURL';
            },
            color: Colors.blue,
            iconColor: Colors.red,
          ),
          NavButton(
            text: "Twitter",
            icon: MdiIcons.twitter,
            onPressed: () async {
              await canLaunch(twitterURL)
                  ? await launch(twitterURL)
                  : throw 'Could not launch $twitterURL';
            },
            color: Colors.blue,
            iconColor: Colors.red,
          ),
          NavButton(
            text: "Facebook",
            icon: MdiIcons.facebook,
            onPressed: () async {
              await canLaunch(facebookURL)
                  ? await launch(facebookURL)
                  : throw 'Could not launch $facebookURL';
            },
            color: Colors.blue,
            iconColor: Colors.red,
          ),
        ];

    return ResponsiveWidget(
      largeScreen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialNavButtons(),
          ),
          SizedBox(
            height: 10,
          ),
          horizontalLine(),
        ],
      ),
      smallScreen: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: socialNavButtons(),
          ),
          SizedBox(
            height: 20,
          ),
          horizontalLine(),
        ],
      ),
    );
  }
}


