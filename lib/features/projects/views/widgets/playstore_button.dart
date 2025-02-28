import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/utils/url_launcher_extension.dart';

class PlaystoreButton extends StatelessWidget {
  final String url;

  const PlaystoreButton({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: Text("Playstore", style: Theme.of(context).textTheme.bodySmall),
      icon: Icon(MdiIcons.googlePlay),
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            visualDensity: VisualDensity.compact,
          ),
      onPressed: url.launchURL,
    );
  }
}
