import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/models/game_data.dart';
import 'package:color_flood/screens/game_screen.dart';
import 'package:color_flood/screens/settings_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:color_flood/components/menu_button.dart';
import 'package:color_flood/components/game_logo.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bestScoreText = '';
    if (context.watch<GameData>().bestScore > 0) {
      bestScoreText = 'Best Score: ${context.watch<GameData>().bestScore}';
    }
    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Consumer<GameData>(
          builder: (context, data, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Expanded(child: Hero(tag: 'logo', child: GameLogo())),
              Expanded(
                child: Column(
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
                    MenuButton(
                      text: 'Settings',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SettingsScreen()));
                      },
                    ),
                  ],
                ),
              ),
              if (context.watch<GameData>().bestScore > 0)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: FittedBox(
                      child: Text(
                        bestScoreText,
                        style: const TextStyle(color: kTextColor),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
