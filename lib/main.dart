import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp3/screen/hompage.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Hexcolor("#1e6496"),
        primaryColor: Hexcolor("#014d6b"),
        primaryIconTheme: IconThemeData(color: Colors.white),
      ),
      home: HomeScreen(),
    );
  }
}