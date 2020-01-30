import 'package:flutter/material.dart';
import './dialog/info_dialog.dart';
import 'responsive_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'nav_button.dart';

class NavHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ResponsiveWidget.isLargeScreen(context) ? NavBarLogo() : Container(),
          Spacer(),
          !ResponsiveWidget.isSmallScreen(context)
              ? Row(
                  children: <Widget>[
                    NavButton(
                      text: "About me",
                     iconColor: Colors.red,
                      icon: MdiIcons.informationOutline,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context)=> InfoDialog(),
                          barrierDismissible: true,
                        );
                      },
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}

class NavBarLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // padding: EdgeInsets.all(10),
      duration: Duration(seconds: 3),
      child: Row(
        children: <Widget>[
          Image.network(
            "https://img.icons8.com/ios-glyphs/30/000000/r.png",
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
    );
  }
}
