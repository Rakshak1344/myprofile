import 'package:flutter/material.dart';

class TitleAndLine extends StatelessWidget {
  final String? preTitle;
  final String title;

  const TitleAndLine({super.key, this.preTitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (preTitle != null)
          Text(
            preTitle!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        // HorizontalLine(),
      ],
    );
  }
}
