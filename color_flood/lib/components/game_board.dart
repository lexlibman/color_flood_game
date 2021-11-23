import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/components/game_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key, required this.gameBrain}) : super(key: key);

  final GameBrain gameBrain;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 40).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gameBrain.movesCounter >= 30) {
      controller.forward();
      return Neumorphic(
        style: kGameBoardStyle,
        child: Container(
            color: widget.gameBrain.chosenColor,
            width: 336,
            height: 336,
            child: Center(
              child: Text(
                'Game Over',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: animation.value,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      );
    } else if (widget.gameBrain.isFilled()) {
      controller.forward();
      return Neumorphic(
        style: kGameBoardStyle,
        child: Container(
            color: widget.gameBrain.chosenColor,
            width: 336,
            height: 336,
            child: Center(
              child: Text(
                'You Win!',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: animation.value,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      );
    } else {
      return Neumorphic(
        style: kGameBoardStyle,
        child: Container(
          color: Colors.white,
          width: 336,
          height: 336,
          child: Column(
            children: widget.gameBrain.board,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
