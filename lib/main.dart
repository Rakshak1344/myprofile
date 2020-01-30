import 'package:flutter/material.dart';
import 'profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorDark: Colors.black38,
        brightness: Brightness.light,
        backgroundColor: Colors.white70
      ),
      home: ProfilePage(),
    );
  }
}
