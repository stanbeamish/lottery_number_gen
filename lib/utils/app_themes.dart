import 'package:flutter/material.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';

final darkMode = ThemeData(
  fontFamily: 'Montserrat',
  primarySwatch: appDarkSwatchColor,
  primaryColor: kColorFour,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  unselectedWidgetColor: kColorTwo,
  toggleableActiveColor: kColorOne,
  sliderTheme: SliderThemeData(
    activeTickMarkColor: kColorOne,
    activeTrackColor: kColorOne,
    thumbColor: kColorOne,
    valueIndicatorColor: kColorThree,
  ),
  buttonColor: kColorThree,
);

final lightMode = ThemeData(
  fontFamily: 'Montserrat',
  primarySwatch: appSwatchColor,
  primaryColor: kColorThree, // cannot use primarySwatch like appSwatchColor[600]
  brightness: Brightness.light,
  backgroundColor: const Color(0xFF25D5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  toggleableActiveColor: kColorThree,
  sliderTheme: SliderThemeData(
    activeTickMarkColor: kColorThree,
    activeTrackColor: kColorThree,
    thumbColor: kColorThree,
    valueIndicatorColor: kColorOne,
  ),
  buttonColor: kColorSix,
);