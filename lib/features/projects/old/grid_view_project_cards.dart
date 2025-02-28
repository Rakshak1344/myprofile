import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/arch/view/responsive_view.dart';
import 'package:profile/features/header/views/nav_button.dart';
import 'package:profile/features/projects/old/desktop_view_cards.dart';


import 'package:url_launcher/url_launcher.dart';

import 'mobile_view_card.dart';

class GridViewProjectCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Arc Space
    String arcSpaceGitHubURL = "https://github.com/Rakshak1344/Arc-Space";
    String arcSpaceFrontImg = "https://gdurl.com/zyPo";
    String arcSpaceBackImg = "https://gdurl.com/Rb1W";
    //Floating Ravini
    String nodeChatAppGitHubURL =
        "https://github.com/Rakshak1344/Node-chat-app";
    String nodeChatAppHostURL = "https://floating-ravine-77436.herokuapp.com/";
    String nodeChatFrontImg = "https://gdurl.com/lc8S";
    String nodeChatBackImg = "https://gdurl.com/uwxW";

    //Today's task
    String flutterTodaysTaskGitHubURL =
        "https://github.com/Rakshak1344/Flutter-TaskApp";
    String todaysTaskFrontImg = "https://gdurl.com/czso";
    String todaysTaskBackImg = "https://gdurl.com/SJv8";

    //Task Routes
    String taskRoutesGitHubURL =
        "https://github.com/Rakshak1344/Task-Manager-API";
    String taskRouteFrontImg = "https://gdurl.com/v2q99";
    String taskRouteBackImg = "https://gdurl.com/xlzB";

    //Chat-bot Booking assist
    String chatbotGitHubURL =
        "https://github.com/Rakshak1344/Chatbot-Booking-Appointment";
    String chatBotFrontImg = "https://gdurl.com/WIdyg";
    String chatBotBackImg = "https://gdurl.com/kZfm";

    return ResponsiveWidget.isSmallScreen(context)
        ? Column(
            children: <Widget>[
              MobileViewCard(
                projectName: "Arc Space",
                projectDescription: "Construction Assist application\n"
                    "helps to sync-up\n"
                    "top-level and middle-level management",
                backImageUrl: arcSpaceBackImg,
                frontImageURL: arcSpaceFrontImg,
                buttons: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NavButton(
                      icon: MdiIcons.codeBraces,
                      iconColor: Colors.red,
                      onPressed: () async {
                        await canLaunch(arcSpaceGitHubURL)
                            ? await launch(arcSpaceGitHubURL)
                            : throw 'Could not launch $arcSpaceGitHubURL';
                      },
                    ),
                  ],
                ),
              ),
              MobileViewCard(
                projectName: "Socket Chat",
                projectDescription: "Chat helpline\n"
                    "helpline chat application \n"
                    "Built on Node.js and Socket.io",
                backImageUrl: nodeChatBackImg,
                frontImageURL: nodeChatFrontImg,
                buttons: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NavButton(
                      icon: MdiIcons.codeBraces,
                      iconColor: Colors.red,
                      onPressed: () async {
                        await canLaunch(nodeChatAppGitHubURL)
                            ? await launch(nodeChatAppGitHubURL)
                            : throw 'Could not launch $nodeChatAppGitHubURL';
                      },
                    ),
                    NavButton(
                      icon: MdiIcons.openInNew,
                      iconColor: Colors.red,
                      onPressed: () async {
                        await canLaunch(nodeChatAppHostURL)
                            ? await launch(nodeChatAppHostURL)
                            : throw 'Could not launch $nodeChatAppGitHubURL';
                      },
                    ),
                  ],
                ),
              ),
              MobileViewCard(
                  projectName: "Today's Task",
                  projectDescription: "Daily Task application\n"
                      "CRUD on task\n"
                      "Integrated light | dark theme",
                  backImageUrl: todaysTaskBackImg,
                  frontImageURL: todaysTaskFrontImg,
                  buttons: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      NavButton(
                        icon: MdiIcons.codeBraces,
                        iconColor: Colors.red,
                        onPressed: () async {
                          await canLaunch(flutterTodaysTaskGitHubURL)
                              ? await launch(flutterTodaysTaskGitHubURL)
                              : throw 'Could not launch $flutterTodaysTaskGitHubURL';
                        },
                      ),
                    ],
                  )),
              MobileViewCard(
                projectName: "Auth Routes",
                projectDescription: "Authentication\n"
                    "register login, create and manage data securily \n"
                    "JWT is used for encryption of user's password and data",
                backImageUrl: taskRouteBackImg,
                frontImageURL: taskRouteFrontImg,
                buttons: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NavButton(
                      icon: MdiIcons.codeBraces,
                      iconColor: Colors.red,
                      onPressed: () async {
                        await canLaunch(taskRoutesGitHubURL)
                            ? await launch(taskRoutesGitHubURL)
                            : throw 'Could not launch $taskRoutesGitHubURL';
                      },
                    ),
                  ],
                ),
              ),
              MobileViewCard(
                projectName: "Chat Bot Assist",
                projectDescription: "Chatbot Assists\n"
                    "people to book appointment\n"
                    "chat bot is the trending application in modern days.",
                backImageUrl: chatBotBackImg,
                frontImageURL: chatBotFrontImg,
                buttons: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NavButton(
                      icon: MdiIcons.codeBraces,
                      iconColor: Colors.red,
                      onPressed: () async {
                        await canLaunch(chatbotGitHubURL)
                            ? await launch(chatbotGitHubURL)
                            : throw 'Could not launch $chatbotGitHubURL';
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        : Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DesktopViewCard(
                    projectName: "Arc Space",
                    projectDescription: "Construction Assist application\n"
                        "helps to sync-up\n"
                        "top-level and middle-level management",
                    backImageUrl: arcSpaceBackImg,
                    frontImageURL: arcSpaceFrontImg,
                    buttons: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        NavButton(
                          icon: MdiIcons.codeBraces,
                          iconColor: Colors.red,
                          onPressed: () async {
                            await canLaunch(arcSpaceGitHubURL)
                                ? await launch(arcSpaceGitHubURL)
                                : throw 'Could not launch $arcSpaceGitHubURL';
                          },
                        ),
                      ],
                    ),
                  ),
                  DesktopViewCard(
                    projectName: "Socket Chat",
                    projectDescription: "Chat helpline\n"
                        "helpline chat application \n"
                        "Built on Node.js and Socket.io",
                    backImageUrl: nodeChatBackImg,
                    frontImageURL: nodeChatFrontImg,
                    buttons: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        NavButton(
                          icon: MdiIcons.codeBraces,
                          iconColor: Colors.red,
                          onPressed: () async {
                            await canLaunch(nodeChatAppGitHubURL)
                                ? await launch(nodeChatAppGitHubURL)
                                : throw 'Could not launch $nodeChatAppGitHubURL';
                          },
                        ),
                        NavButton(
                          icon: MdiIcons.openInNew,
                          iconColor: Colors.red,
                          onPressed: () async {
                            await canLaunch(nodeChatAppHostURL)
                                ? await launch(nodeChatAppHostURL)
                                : throw 'Could not launch $nodeChatAppGitHubURL';
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DesktopViewCard(
                      projectName: "Today's Task",
                      projectDescription: "Daily Task application\n"
                          "Create, read, update, and delete task\n"
                          "Integrated light and dark theme, toggle switch to enable dark theme",
                      backImageUrl: todaysTaskBackImg,
                      frontImageURL: todaysTaskFrontImg,
                      buttons: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          NavButton(
                            icon: MdiIcons.codeBraces,
                            iconColor: Colors.red,
                            onPressed: () async {
                              await canLaunch(flutterTodaysTaskGitHubURL)
                                  ? await launch(flutterTodaysTaskGitHubURL)
                                  : throw 'Could not launch $flutterTodaysTaskGitHubURL';
                            },
                          ),
                        ],
                      )),
                  DesktopViewCard(
                    projectName: "Auth Routes",
                    projectDescription: "Authentication\n"
                        "register login, create and manage data securily \n"
                        "JWT is used for encryption of user's password and data",
                    backImageUrl: taskRouteBackImg,
                    frontImageURL: taskRouteFrontImg,
                    buttons: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        NavButton(
                          icon: MdiIcons.codeBraces,
                          iconColor: Colors.red,
                          onPressed: () async {
                            await canLaunch(taskRoutesGitHubURL)
                                ? await launch(taskRoutesGitHubURL)
                                : throw 'Could not launch $taskRoutesGitHubURL';
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DesktopViewCard(
                    projectName: "Chat Bot Assist",
                    projectDescription: "Chatbot Assists\n"
                        "people to book appointment\n"
                        "chat bot is the trending application in modern days.",
                    backImageUrl: chatBotBackImg,
                    frontImageURL: chatBotFrontImg,
                    buttons: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        NavButton(
                          icon: MdiIcons.codeBraces,
                          iconColor: Colors.red,
                          onPressed: () async {
                            await canLaunch(chatbotGitHubURL)
                                ? await launch(chatbotGitHubURL)
                                : throw 'Could not launch $chatbotGitHubURL';
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
  }
}
