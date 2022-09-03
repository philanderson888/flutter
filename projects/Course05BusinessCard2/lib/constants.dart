import 'package:flutter/material.dart';

// color foreground
var kColorLightPink01 = Colors.black12;
var kColorLightGrey02 = Colors.black26;
var kColorDarkGrey01 = const Color(0xFF595c5b);

// color background

var kDarkTeal = Colors.teal.shade800;
var kPurple = Colors.purple;
var kPurple400 = Colors.purple.shade400;
var kLightPurple = const Color(0xffab47bc);
var kPurpleAccent = Colors.purpleAccent;
var kDarkPurple = const Color(0xFF46016E);
var kDeepPurple = const Color(0xFF4C2973);
var kSkyBlue = const Color(0xFF8997E7);
var kLightSkyBlue = const Color(0xFFA6B2DE);
var kVeryLightSkyBlue = const Color(0xFFBAC2E1);
var kSuperLightSkyBlue = const Color(0xFFD1D3E8);

var kGold = const Color(0xFFF2B64B);
var kCerise = const Color(0xFFE31D6B);

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColorPurple = MaterialColor(0xFFAB47BC, color);
var kBmiSliderColor = const Color(0xFF8D8E98);
var kBmiPrimaryColor = const Color(0xFF0A0E21);

// Text Styles

var kAppHomePageHeader = TextStyle(
  fontSize: 25,
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
  color: Color(0xFFBEE4CB),
  fontSize: 80.0,
  fontWeight: FontWeight.bold,
);

var kTextStyleSize60ColorBEE4CB = const TextStyle(
  color: Color(0xFFBEE4CB),
  fontSize: 60.0,
  fontWeight: FontWeight.bold,
);

var kBmiAppBarTextStyle = TextStyle(
  fontSize: 30,
  color: kPurple400,
);

var kPacifico55White = const TextStyle(
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
var kBmiScoreHeader = const Text('Your BMI Score');
var kBmiCalculateText = 'CALCULATE YOUR BMI';
var kBmiRecalculateText = 'RECALCULATE YOUR BMI';

// Forms

// Sizes
var kBmiSliderMin = 120.0;
var kBmiSliderMax = 220.0;

// Data for Bitcoin App

const List<String> kCurrenciesList = [
  'GBP',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

var kCurrenciesDropDownList =
    kCurrenciesList.map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}).toList();
