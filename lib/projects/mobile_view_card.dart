import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class MobileViewCard extends StatelessWidget {
  String projectName;
  String projectDescription;
  String frontImageURL;
  String backImageUrl;
  Row buttons;
  MobileViewCard({
    required this.projectName,
    required this.projectDescription,
    required this.frontImageURL,
    required this.backImageUrl,
    required this.buttons
  });
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Expanded(
        child: Container(
          height: 200,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 14,
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
                        image: NetworkImage(
                          frontImageURL,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        projectName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1.5,
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          projectDescription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Click to flip"),
                            Icon(
                              MdiIcons.flipToBack,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      back: Expanded(
        child: Container(
          height: 200,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 14,
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
                        image: NetworkImage(
                          backImageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Text(
                          "More",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1.5,
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      buttons,
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Click to flip back"),
                            Icon(
                              MdiIcons.flipToFront,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
