import 'package:flutter/material.dart';

const kColorOne = Color(0xFFF3E408);
const kColorTwo = Color(0xFF707070);
const kColorThree = Color(0xFF9C9C02);
const kColorFour = Color(0xFF403C3C);
const kColorFive = Color(0xFDF0FCFE);
const int _kColorFour = 0xFF403C3C;

Map<int, Color> appSwatchColorMap =
{
  50:Color.fromRGBO(64,60,60, .1),
  100:Color.fromRGBO(64,60,60, .2),
  200:Color.fromRGBO(64,60,60, .3),
  300:Color.fromRGBO(64,60,60, .4),
  400:Color.fromRGBO(64,60,60, .5),
  500:Color(_kColorFour),
  600:Color.fromRGBO(64,60,60, .7),
  700:Color.fromRGBO(64,60,60, .8),
  800:Color.fromRGBO(64,60,60, .9),
  900:Color.fromRGBO(64,60,60, 1),
};

MaterialColor appSwatchColor = MaterialColor(0xFFFCC300, appSwatchColorMap);

Map<int, Color> appDarkSwatchColorMap =
{
  50:Color.fromRGBO(64,60,60, .1),
  100:Color.fromRGBO(64,60,60, .2),
  200:Color.fromRGBO(64,60,60, .3),
  300:Color.fromRGBO(64,60,60, .4),
  400:Color.fromRGBO(64,60,60, .5),
  500:Color(_kColorFour),
  600:Color.fromRGBO(64,60,60, .7),
  700:Color.fromRGBO(64,60,60, .8),
  800:Color.fromRGBO(64,60,60, .9),
  900:Color.fromRGBO(64,60,60, 1),
};

MaterialColor appDarkSwatchColor = MaterialColor(0xFF463606, appDarkSwatchColorMap);