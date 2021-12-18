import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/components/game_board.dart';
import 'package:color_flood/components/next_level_button.dart';
import 'package:color_flood/components/restart_button.dart';
import 'package:color_flood/models/game_brain.dart';
import 'package:provider/provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../components/color_button.dart';
import 'package:flutter/services.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameBrain>(
      builder: (context, brain, child) => Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          leading: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.black12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: kTextColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.black12),
              ),
              child: const Icon(
                Icons.restart_alt,
                color: kTextColor,
              ),
              onPressed: () {
                brain.resetGame();
              },
            ),
          ],
          backgroundColor: kMainColor,
          title: const Text(
            'Color Flood',
            style: TextStyle(color: kTextColor),
          ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neumorphic(
                            style: kNeumorphicStyle,
                            child: SizedBox(
                              height: 50,
                              width: 140,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      child: child, scale: animation);
                                },
                                child: Text(
                                  '${context.watch<GameBrain>().highScore}',
                                  key: ValueKey<int>(
                                      context.watch<GameBrain>().highScore),
                                  style: const TextStyle(
                                      color: kTextColor, fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Neumorphic(
                            style: kNeumorphicStyle,
                            child: SizedBox(
                              height: 50,
                              width: 60,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      child: child, scale: animation);
                                },
                                child: Text(
                                  '${context.watch<GameBrain>().movesCounter}',
                                  key: ValueKey<int>(
                                      context.watch<GameBrain>().movesCounter),
                                  style: const TextStyle(
                                      color: kTextColor, fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          NeumorphicText(
                            '/',
                            style: const NeumorphicStyle(color: kTextColor),
                            textStyle: NeumorphicTextStyle(
                              fontSize: 35,
                            ),
                          ),
                          Neumorphic(
                            style: kNeumorphicStyle,
                            child: SizedBox(
                              height: 50,
                              width: 60,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      child: child, scale: animation);
                                },
                                child: Text(
                                  '${brain.movesLimit}',
                                  key: ValueKey<int>(brain.movesLimit),
                                  style: const TextStyle(
                                      color: kTextColor, fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GameBoard(
                      restartGameButton: RestartGameButton(onPressed: () {
                        brain.resetGame();
                      }),
                      nextLevelButton: NextLevelButton(onPressed: () {
                        brain.nextLevel();
                      }),
                    ),
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
                          sound: 'note1.wav',
                        ),
                        ColorButton(
                          color: k2Color,
                          sound: 'note2.wav',
                        ),
                        ColorButton(
                          color: k3Color,
                          sound: 'note3.wav',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ColorButton(
                          color: k4Color,
                          sound: 'note4.wav',
                        ),
                        ColorButton(
                          color: k5Color,
                          sound: 'note5.wav',
                        ),
                        ColorButton(
                          color: k6Color,
                          sound: 'note6.wav',
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
