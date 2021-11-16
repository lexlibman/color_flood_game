import 'package:color_flood/assets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/animation.dart';

class ColorButton extends StatefulWidget {
  const ColorButton({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 50));
    animation = Tween<double>(begin: 4, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has been changed here
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.forward();
        Future.delayed(const Duration(milliseconds: 250), () {
          controller.reverse();
        });
      },
      child: Neumorphic(
        padding: const EdgeInsets.all(15),
        style: NeumorphicStyle(
            surfaceIntensity: 0,
            shadowLightColor: Colors.grey,
            shadowDarkColor: Colors.black,
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: animation.value,
            lightSource: LightSource.topLeft,
            color: kMainColor),
        child: Container(
          color: kMainColor,
          height: 15,
          width: 70,
          child: Container(
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
