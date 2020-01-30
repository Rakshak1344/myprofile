import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import './dialog/info_dialog.dart';
import './footer/footer.dart';
import './profile_info.dart';
import './projects/grid_view_project_cards.dart';
import 'responsive_view.dart';
import 'social_info.dart';

import 'nav_button.dart';
import 'nav_header.dart';
import 'projects-Header/project_header.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white70,
                automaticallyImplyLeading: false,
                iconTheme: IconThemeData(color: Colors.black),
                title: AnimatedContainer(
                  padding: EdgeInsets.all(10),
                  duration: Duration(seconds: 3),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        "https://img.icons8.com/ios-glyphs/60/000000/r.png",
                        color: Colors.white,
                      ),
                      AnimatedContainer(
                        curve: Curves.bounceIn,
                        duration: Duration(seconds: 2),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        endDrawer: ResponsiveWidget.isSmallScreen(context)
            ? Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height,
                child: Drawer(
                  elevation: 0.0,
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: <Widget>[
                      NavButton(
                        text: "Info",
                        iconColor: Colors.red,
                        icon: MdiIcons.informationOutline,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => InfoDialog(),
                            barrierDismissible: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            : null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 2),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1 / 2,
                vertical: MediaQuery.of(context).size.height * 0.1 / 1),
            child: ResponsiveWidget(
              largeScreen: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavHeader(),
                  ProfileInfo(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SocialInfo(),
                  SizedBox(
                    height: 20,
                  ),
                  ProjectHeaderName(),
                  SizedBox(
                    height: 20,
                  ),
                  GridViewProjectCards(),
                  Footer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
