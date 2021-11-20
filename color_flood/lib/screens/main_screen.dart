import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/components/game_board.dart';
import 'package:color_flood/components/game_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../components/color_button.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GameBrain gameBrain = GameBrain();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    gameBrain.generateBoard(14);
    gameBrain.createBoard();
  }

  @override
  Widget build(BuildContext context) {
    GameBoard gameBoard = GameBoard(
      gameBrain: gameBrain,
    );
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const Text('Color Flood'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Neumorphic(
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
              style: NeumorphicStyle(
                  lightSource: LightSource.top,
                  surfaceIntensity: 0,
                  shadowLightColor: Colors.grey,
                  shadowDarkColor: Colors.black,
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 4,
                  color: kMainColor),
              child: Container(
                color: kMainColor,
                child: Container(
                  alignment: Alignment.center,
                  child: gameBoard,
                  decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColorButton(
                        color: k1Color,
                        onPressed: () {
                          setState(() {
                            gameBrain.makeMove(0);
                          });
                        },
                      ),
                      ColorButton(
                        color: k2Color,
                        onPressed: () {
                          setState(() {
                            gameBrain.makeMove(1);
                          });
                        },
                      ),
                      ColorButton(
                        color: k3Color,
                        onPressed: () {
                          setState(() {
                            gameBrain.makeMove(2);
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColorButton(
                        color: k4Color,
                        onPressed: () {
                          setState(() {
                            gameBrain.makeMove(3);
                          });
                        },
                      ),
                      ColorButton(
                        color: k5Color,
                        onPressed: () {
                          setState(() {
                            gameBrain.makeMove(4);
                          });
                        },
                      ),
                      ColorButton(
                        color: k6Color,
                        onPressed: () {
                          setState(() {
                            gameBrain.makeMove(5);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
