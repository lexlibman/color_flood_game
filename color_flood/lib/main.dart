import 'package:color_flood/models/game_brain.dart';
import 'package:color_flood/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GameBrain(),
        )
      ],
      child: MaterialApp(
        title: 'Coloringator',
        theme: ThemeData.dark(),
        home: MainMenu(),
      ),
    );
  }
}
