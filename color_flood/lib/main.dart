import 'package:color_flood/assets/constants.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coloringator',
      theme: ThemeData(
        primaryColor: kMainColor,
      ),
      home: const MainScreen(),
    );
  }
}
