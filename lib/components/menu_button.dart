import 'package:color_flood/models/game_data.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:color_flood/assets/constants.dart';
import 'package:provider/provider.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameData>(
      builder: (context, data, child) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: NeumorphicButton(
          provideHapticFeedback: data.isHapticOn,
          style: kNeumorphicStyle,
          onPressed: onPressed,
          child: SizedBox(
            height: 30,
            width: 200,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}
