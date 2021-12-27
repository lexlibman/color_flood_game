import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/models/game_data.dart';
import 'package:color_flood/screens/game_screen.dart';
import 'package:color_flood/screens/settings_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:color_flood/components/menu_button.dart';

class MainMenu extends StatelessWidget {
  MainMenu({Key? key}) : super(key: key);

  final GameData gameBrain = GameData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Center(
        child: Consumer<GameData>(
          builder: (context, data, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (data.movesCounter > 0)
                MenuButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const GameScreen()));
                  },
                ),
              const SizedBox(
                height: 25,
              ),
              MenuButton(
                text: 'New Game',
                onPressed: () {
                  data.resetGame();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const GameScreen()));
                },
              ),
              const SizedBox(
                height: 25,
              ),
              MenuButton(
                text: 'Settings',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SettingsScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
