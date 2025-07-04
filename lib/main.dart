import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:profile/my_app.dart';
import 'package:profile/my_app_config.dart';
import 'package:profile/splash_app.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const SplashApp());

  MyAppConfig().init(child: const MyApp()).then((widget) => runApp(widget));
}
