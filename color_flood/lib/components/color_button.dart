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
    );
  }
}
