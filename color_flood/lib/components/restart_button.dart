import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:color_flood/assets/constants.dart';

class RestartGameButton extends StatelessWidget {
  const RestartGameButton({Key? key, required this.onPressed})
      : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('RESTART',
              style: TextStyle(fontSize: 20, color: Colors.white70)),
          Icon(
            Icons.restart_alt,
            color: Colors.white70,
          ),
        ],
      ),
      style: kNeumorphicStyle,
      onPressed: () {
        onPressed();
      },
    );
  }
}
