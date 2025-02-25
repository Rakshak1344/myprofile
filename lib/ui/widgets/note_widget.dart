import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  final String note;

  const NoteWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Text(
        note,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 10,
            ),
      ),
    );
  }
}
