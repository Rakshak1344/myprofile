import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DesktopViewCard extends StatelessWidget {
  final String projectName;
  final String projectDescription;
  final String frontImageURL;
  final String backImageUrl;
  final Column buttons;

  const DesktopViewCard(
      {super.key,
      required this.projectName,
      required this.projectDescription,
      required this.frontImageURL,
      required this.backImageUrl,
      required this.buttons});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width / 3,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3 * 0.5,
                  height: 250,
                  child: Image.network(
                    frontImageURL,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              projectName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Container(
                              color: Colors.black,
                              height: 1.5,
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          projectDescription,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const Text("Click to flip"),
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
          )),
      back: SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width / 3,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3 * 0.6,
                height: 250,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  backImageUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              "More",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Container(
                              color: Colors.black,
                              height: 1.5,
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ],
                        ),
                      ),
                      buttons,
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const Text("Click to flip"),
                            Icon(
                              MdiIcons.flipToBack,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
