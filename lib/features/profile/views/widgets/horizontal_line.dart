import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      width: MediaQuery.of(context).size.width,
      color: Colors.blueGrey,
    );
  }
}
