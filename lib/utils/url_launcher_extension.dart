import 'package:flutter/material.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:url_launcher/url_launcher.dart';

extension UrlLauncherExtension on String? {
  void launchURL() async {
    var context = AppConfig.navigatorKey.currentContext;
    if (this == null) {
      ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(content: Text("Could not open the the link $this")));
      return;
    }

    var uri = Uri.parse(this!);
    if (!await launchUrl(uri)) {
      if (!context!.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Could not open the the link $uri")));
    }
  }
}
