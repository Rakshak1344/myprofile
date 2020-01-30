import 'package:flutter/material.dart';
import '../responsive_view.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget builtOnFlutterText() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Built responsive on ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            ),
            Text("{", style: TextStyle(color: Colors.black, fontSize: 30)),
            SizedBox(
                height: 20,
                width: 20,
                child: Image.network(
                  ResponsiveWidget.isLargeScreen(context)
                      ? "https://img.icons8.com/ios/50/000000/flutter.png"
                      : "https://img.icons8.com/color/48/000000/flutter.png",
                )),
            Text("}", style: TextStyle(color: Colors.black, fontSize: 30)),
          ],
        );
    Widget horizontalLine() => Container(
          height: 1.5,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueGrey,
        );
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        horizontalLine(),
        builtOnFlutterText(),
      ],
    );
  }
}
