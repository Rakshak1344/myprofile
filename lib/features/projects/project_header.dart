import 'package:flutter/material.dart';

class ProjectHeaderName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RichText(
          text: TextSpan(style: TextStyle(letterSpacing: 5), children: [
            TextSpan(
                text: "P", style: TextStyle(color: Colors.red, fontSize: 36)),
            TextSpan(
                text: "rojects",
                style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
          ]),
        ),
        RichText(
          text: TextSpan(style: TextStyle(letterSpacing: 5), children: [
            TextSpan(
                text: "{", style: TextStyle(color: Colors.black, fontSize: 36)),
            TextSpan(
                text: "<", style: TextStyle(color: Colors.red, fontSize: 30)),
            TextSpan(
                text: "/",
                style: TextStyle(color: Colors.blueGrey, fontSize: 30)),
            TextSpan(
                text: ">", style: TextStyle(color: Colors.red, fontSize: 30)),
            TextSpan(
                text: "}", style: TextStyle(color: Colors.black, fontSize: 36)),
          ]),
        )
      ],
    );
  }
}
