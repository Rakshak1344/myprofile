import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(),
            ),
            const SizedBox(width: 24),
            Text(
              'Logging In',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
