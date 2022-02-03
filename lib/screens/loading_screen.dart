import 'dart:async';

import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/components/game_logo.dart';
import 'package:color_flood/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:color_flood/models/game_data.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const MainMenu(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 1000),
        ),
        // MaterialPageRoute(
        //     builder: (BuildContext context) => const MainMenu()));
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<GameData>().loadPreferences();
    return const Scaffold(
      backgroundColor: kMainColor,
      body: Center(
        child: Hero(tag: 'logo', child: GameLogo()),
      ),
    );
  }
}
