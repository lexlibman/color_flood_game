import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/components/game_board.dart';
import 'package:color_flood/components/game_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../components/color_button.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GameBrain gameBrain = GameBrain();
  final AudioCache audioCache = AudioCache();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    gameBrain.generateBoard(14);
    gameBrain.createBoard();
    setState(() {});
  }

  playSound(String sound) {
    audioCache.play(sound, mode: PlayerMode.LOW_LATENCY);
  }

  @override
  Widget build(BuildContext context) {
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
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              color: kMainColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Neumorphic(
                    style: kNeumorphicStyle,
                    child: SizedBox(
                      height: 45,
                      width: 90,
                      child: Center(
                        child: Text(
                          '${gameBrain.movesCounter}/30',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GameBoard(gameBrain: gameBrain),
                  // NeumorphicButton(
                  //   child: const Icon(
                  //     Icons.restart_alt,
                  //     color: Colors.white70,
                  //   ),
                  //   style: kNeumorphicStyle,
                  //   onPressed: () {
                  //     setState(() {
                  //       gameBrain.resetGame();
                  //     });
                  //   },
                  // )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColorButton(
                        color: k1Color,
                        onPressed: () {
                          playSound('note1.wav');
                          setState(() {
                            gameBrain.makeMove(0);
                          });
                        },
                      ),
                      ColorButton(
                        color: k2Color,
                        onPressed: () {
                          playSound('note2.wav');
                          setState(() {
                            gameBrain.makeMove(1);
                          });
                        },
                      ),
                      ColorButton(
                        color: k3Color,
                        onPressed: () {
                          playSound('note3.wav');
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
                          playSound('note4.wav');
                          setState(() {
                            gameBrain.makeMove(3);
                          });
                        },
                      ),
                      ColorButton(
                        color: k5Color,
                        onPressed: () {
                          playSound('note5.wav');
                          setState(() {
                            gameBrain.makeMove(4);
                          });
                        },
                      ),
                      ColorButton(
                        color: k6Color,
                        onPressed: () {
                          playSound('note6.wav');
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
