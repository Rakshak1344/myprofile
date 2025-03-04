import 'package:flutter/material.dart';
import 'package:profile/my_app.dart';
import 'package:profile/my_app_config.dart';
import 'package:profile/splash_app.dart';

void main() {
  runApp(const SplashApp());

  MyAppConfig().init(child: const MyApp()).then((widget) => runApp(widget));
}
