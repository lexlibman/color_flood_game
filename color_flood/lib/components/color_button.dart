import 'package:color_flood/assets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    Key? key,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(15),
      onPressed: onPressed,
      style: NeumorphicStyle(
          lightSource: LightSource.top,
          surfaceIntensity: 0.1,
          shadowLightColor: Colors.grey,
          shadowDarkColor: Colors.black,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          color: kMainColor),
      child: Container(
        color: kMainColor,
        height: 15,
        width: 70,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
