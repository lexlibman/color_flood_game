import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/components/game_brain.dart';
import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key, required this.gameBrain}) : super(key: key);

  final GameBrain gameBrain;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          lightSource: LightSource.top,
          surfaceIntensity: 0.1,
          shadowLightColor: Colors.grey,
          shadowDarkColor: Colors.black,
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(6)),
          depth: 2,
          color: kMainColor),
      child: Container(
        color: Colors.white,
        width: 322,
        height: 322,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: gameBrain.board,
        ),
      ),
    );
  }
}
