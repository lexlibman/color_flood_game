import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/models/game_data.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

class ColorButton extends StatelessWidget {
  final AudioCache audioCache = AudioCache();
  ColorButton({
    Key? key,
    required this.color,
    required this.sound,
  }) : super(key: key);

  final Color color;
  final String sound;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameData>(
      builder: (context, data, child) => NeumorphicButton(
        provideHapticFeedback: data.isHapticOn,
        padding: const EdgeInsets.all(15),
        onPressed: () {
          if (data.isSoundOn) {
            audioCache.play(sound);
          }
          data.makeMove(kColorsList.indexOf(color));
        },
        style: kNeumorphicStyle,
        child: Container(
          color: kMainColor,
          height: 16,
          width: 70,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
