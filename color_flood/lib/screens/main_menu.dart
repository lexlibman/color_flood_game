import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/models/game_brain.dart';
import 'package:color_flood/screens/game_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatelessWidget {
  MainMenu({Key? key}) : super(key: key);

  final GameBrain gameBrain = GameBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Center(
        child: Consumer<GameBrain>(
          builder: (context, brain, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (brain.movesCounter > 0)
                NeumorphicButton(
                  style: kNeumorphicStyle,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const GameScreen()));
                  },
                  child: const SizedBox(
                    height: 30,
                    width: 200,
                    child: Text(
                      'Continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: kTextColor),
                    ),
                  ),
                ),
              const SizedBox(
                height: 25,
              ),
              NeumorphicButton(
                style: kNeumorphicStyle,
                onPressed: () {
                  brain.resetGame();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const GameScreen()));
                },
                child: const SizedBox(
                  height: 30,
                  width: 200,
                  child: Text(
                    'New Game',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: kTextColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              NeumorphicButton(
                style: kNeumorphicStyle,
                onPressed: () {},
                child: const SizedBox(
                  height: 30,
                  width: 200,
                  child: Text(
                    'Settings',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: kTextColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
