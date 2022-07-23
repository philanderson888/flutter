import 'package:flutter/material.dart';

// color foreground
var kColorLightPink01 = Colors.black12;
var kColorLightGrey02 = Colors.black26;
var kColorDarkGrey01 = const Color(0xFF595c5b);

// color background

var kDarkTeal = Colors.teal.shade800;
var kPurple = Colors.purple;
var kPurple400 = Colors.purple.shade400;
var kPurpleAccent = Colors.purpleAccent;

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
var kBmiSliderColor = const Color(0xFF8D8E98);
var kBmiPrimaryColor = const Color(0xFF0A0E21);

// Text Styles

var kAppHomePageHeader = TextStyle(
  fontSize: 35,
  fontFamily: "SourceSansPro",
  color: Colors.teal.shade600,
  fontWeight: FontWeight.bold,
);

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

var kTextStyleSize80ColorBEE4CB = const TextStyle(
  color: const Color(0xFFBEE4CB),
  fontSize: 80.0,
  fontWeight: FontWeight.bold,
);

var kTextStyleSize60ColorBEE4CB = const TextStyle(
  color: const Color(0xFFBEE4CB),
  fontSize: 60.0,
  fontWeight: FontWeight.bold,
);

var kBmiAppBarTextStyle = TextStyle(
  fontSize: 30,
  color: kPurple400,
);

var kPacifico55White = TextStyle(
  fontSize: 55,
  fontWeight: FontWeight.w400,
  fontFamily: "Pacifico",
  color: Colors.white,
);

var kSourceSansPro35Teal = TextStyle(
  fontSize: 35,
  fontFamily: "SourceSansPro",
  color: Colors.teal.shade100,
  fontWeight: FontWeight.bold,
);

var kSourceSansPro30Teal = TextStyle(
  fontSize: 30,
  fontFamily: "SourceSansPro",
  color: Colors.teal.shade100,
  fontWeight: FontWeight.bold,
);

var kSourceSansPro30TealDark = TextStyle(
  fontSize: 30,
  fontFamily: "SourceSansPro",
  color: Colors.teal.shade900,
  fontWeight: FontWeight.bold,
);

// Button

var kAppHeaderButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
);

// Text
var kBmiScoreHeader = Container(child: Text('Your BMI Score'));

// Forms

// Sizes
var kBmiSliderMin = 120.0;
var kBmiSliderMax = 220.0;
