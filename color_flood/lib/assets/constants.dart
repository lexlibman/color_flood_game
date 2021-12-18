import 'package:flutter_neumorphic/flutter_neumorphic.dart';

const Color k1Color = Color(0xFFF6D7A7);
const Color k2Color = Color(0xFF6B4F4F);
const Color k3Color = Color(0xFFC8E3D4);
const Color k4Color = Color(0xFF125C13);
const Color k5Color = Color(0xFF864879);
const Color k6Color = Color(0xFFB91646);
const Color k7Color = Color(0xFF161E54);

List kColorsList = [
  k1Color,
  k2Color,
  k3Color,
  k4Color,
  k5Color,
  k6Color,
];

const Color kMainColor = Color(0xFF232426);

const Color kTextColor = Colors.white70;

const NeumorphicStyle kNeumorphicStyle = NeumorphicStyle(
    lightSource: LightSource.topLeft,
    surfaceIntensity: 0,
    shadowLightColor: Colors.grey,
    shadowDarkColor: Colors.black,
    shape: NeumorphicShape.concave,
    depth: 4,
    color: kMainColor);

const NeumorphicStyle kGameBoardStyle = NeumorphicStyle(
    lightSource: LightSource.topLeft,
    border: NeumorphicBorder(width: 8),
    surfaceIntensity: 0,
    shadowLightColor: Colors.grey,
    shadowDarkColor: Colors.black,
    shape: NeumorphicShape.flat,
    depth: 6,
    color: kMainColor);
