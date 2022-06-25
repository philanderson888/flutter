import 'package:flutter/material.dart';

var kBmiSliderMin = 120.0;
var kBmiSliderMax = 220.0;
var kBmiSliderColor = const Color(0xFF8D8E98);
var kBmiPrimaryColor = const Color(0xFF0A0E21);

var kBmiHugeTextStyle = const TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

var kBmiLargeTextStyle = const TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
);

var kBmiResultsTextStyle = const TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

var kBmiScoreTextStyle = const TextStyle(
  color: const Color(0xFFBEE4CB),
  fontSize: 80.0,
  fontWeight: FontWeight.bold,
);

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColorPurple = MaterialColor(0xFFAB47BC, color);

var kBmiAppBarTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.purple.shade400,
);

var kBmiScoreHeader = Container(child: Text('Your BMI Score'));
