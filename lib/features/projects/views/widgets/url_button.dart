import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/resources/resources.dart';
import 'package:profile/utils/url_launcher_extension.dart';

class UrlButton extends StatelessWidget {
  final String url;

  const UrlButton({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final Map<String, (String label, dynamic icon)> buttonConfig = {
      'play.google.com': ('Playstore', MdiIcons.googlePlay),
      'github.com': ('GitHub', MdiIcons.github),
      'pub.dev': ('Dart', TechImage.dart),
      'custom.com': ('Link', MdiIcons.link),
    };

    final entry = buttonConfig.entries.firstWhere(
      (e) => url.contains(e.key),
      orElse: () => MapEntry('default', ('Link', MdiIcons.link)),
    );

    final (label, icon) = entry.value;

    return OutlinedButton.icon(
      label: Text(label, style: Theme.of(context).textTheme.bodySmall),
      icon: icon is IconData
          ? Icon(icon,color: Theme.of(context).colorScheme.primary)
          : Image.asset(icon, width: 32, height: 28, color: Theme.of(context).colorScheme.primary),
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            visualDensity: VisualDensity.compact,
          ),
      onPressed: url.launchURL,
    );
  }
}
