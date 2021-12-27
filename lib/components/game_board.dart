import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/models/game_data.dart';
import 'package:color_flood/components/restart_button.dart';
import 'package:provider/provider.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'next_level_button.dart';

class GameBoard extends StatelessWidget {
  const GameBoard(
      {Key? key,
      required this.restartGameButton,
      required this.nextLevelButton})
      : super(key: key);

  final RestartGameButton restartGameButton;
  final NextLevelButton nextLevelButton;

  @override
  Widget build(BuildContext context) {
    Widget currentBoard;
    if (context.watch<GameData>().isFilled) {
      int multiply = context.watch<GameData>().movesLimit -
          context.watch<GameData>().movesCounter +
          1;
      String message;
      if (context.watch<GameData>().movesCounter ==
          context.watch<GameData>().movesLimit) {
        message = 'Do your best in next round!';
      } else {
        message = 'Your points will be multiplied by $multiply times!';
      }
      currentBoard = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NeumorphicText(
            'Well Done!',
            style: kNeumorphicStyle,
            textStyle: NeumorphicTextStyle(fontSize: 35),
          ),
          NeumorphicText(
            message,
            style: kNeumorphicStyle,
            textStyle: NeumorphicTextStyle(
              fontSize: 25,
            ),
          ),
          nextLevelButton,
        ],
      );
    } else if (!context.watch<GameData>().isFilled &&
        context.watch<GameData>().movesCounter >=
            context.watch<GameData>().movesLimit) {
      currentBoard = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NeumorphicText(
            'No Moves Left!',
            style: kNeumorphicStyle,
            textStyle: NeumorphicTextStyle(fontSize: 35),
          ),
          restartGameButton,
        ],
      );
    } else {
      currentBoard = Column(
        children: context.watch<GameData>().board,
      );
    }
    return Consumer<GameData>(
      builder: (context, brain, child) => Neumorphic(
        style: kGameBoardStyle,
        child: Container(
          color: brain.chosenColor,
          width: 336,
          height: 336,
          child: currentBoard,
        ),
      ),
    );
  }
}
