import 'package:flutter/material.dart';
import 'package:profile/ui/theme/app_theme.dart';

class SplashApp extends StatelessWidget {
  const SplashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      darkTheme: AppTheme.light,
      theme: AppTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Rakshtih\'s Profile',
    );
  }
}
