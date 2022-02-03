import 'package:flutter/material.dart';
import 'package:color_flood/assets/constants.dart';

class GameLogo extends StatefulWidget {
  const GameLogo({Key? key}) : super(key: key);

  @override
  _GameLogoState createState() => _GameLogoState();
}

class _GameLogoState extends State<GameLogo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 24,
                width: 24,
                color: k1Color,
              ),
              Container(
                height: 24,
                width: 24,
                color: k2Color,
              ),
              Container(
                height: 24,
                width: 24,
                color: k3Color,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 24,
                width: 24,
                color: k4Color,
              ),
              Container(
                height: 24,
                width: 24,
                color: k5Color,
              ),
              Container(
                height: 24,
                width: 24,
                color: k6Color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
