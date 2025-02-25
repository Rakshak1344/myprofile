import 'package:flutter/material.dart';
import 'package:profile/arch/view/responsive_view.dart';

class BuiltResponsiveFlutter extends StatelessWidget {
  final flutterIcon = "https://img.icons8.com/ios/50/000000/flutter.png";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Built responsive  ",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 20, width: 20, child: Image.network(flutterIcon)),
      ],
    );
  }
}
