import 'package:color_flood/assets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../components/color_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const Text('Color Flood'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Neumorphic(
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              style: NeumorphicStyle(
                  surfaceIntensity: 0.1,
                  shadowLightColor: Colors.grey,
                  shadowDarkColor: Colors.black,
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 4,
                  lightSource: LightSource.topLeft,
                  color: kMainColor),
              child: Container(
                color: kMainColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ColorButton(
                        color: k1Color,
                      ),
                      ColorButton(
                        color: k2Color,
                      ),
                      ColorButton(
                        color: k3Color,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ColorButton(
                        color: k4Color,
                      ),
                      ColorButton(
                        color: k5Color,
                      ),
                      ColorButton(
                        color: k6Color,
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
