import 'package:flutter/material.dart';
import 'package:street_pastors/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:rich_console/rich_console.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    print('app is running in debug mode');
  }
  else {
    print('app is running in release mode');
  }

  logger.d('Log message with 2 methods');

  loggerNoStack.i('Info message');

  loggerNoStack.w('Just a warning!');

  logger.e('Error! Something bad happened', 'Test Error');

  loggerNoStack.v({'key': 5, 'value': 'something'});

  Logger(printer: SimplePrinter(colors: true)).v('boom');

  if (kDebugMode){
    ansiColorDisabled = false;
    final penWhiteBold = AnsiPen()..white(bold:true);
    print(penWhiteBold("Bright white foreground") + ' .. default text');
    final penWhiteWithPeachBackground = AnsiPen()..white()..rgb(r:1.0,g:0.8,b:0.2);
    print(penWhiteWithPeachBackground("White foreground with peach background"));
  }

  for (var r = 0; r < 6; r++) {

    final sb = StringBuffer();
    final pen = AnsiPen();

    sb.write('\n');
    for (var g = 0; g < 6; g++) {
      for (var b = 0; b < 6; b++) {
        var c = r * 36 + g * 6 + b + 16;
        pen
          ..reset()
          ..rgb(r: r / 5, g: g / 5, b: b / 5, bg: true)
          ..white(bold: true);
        sb.write(pen(' this is some text '));
        pen
          ..reset()
          ..rgb(r: r / 5, g: g / 5, b: b / 5);
        sb.write(pen(' this is some text '));
      }
      sb.write('\n');
    }

    for (var c = 0; c < 24; c++) {
      if (0 == c % 8) {
        sb.write('\n');
      }
      pen
        ..reset()
        ..gray(level: c / 23, bg: true)
        ..white(bold: true);
      sb.write(pen(' some text'));
      pen
        ..reset()
        ..gray(level: c / 23);
      sb.write(pen(' some text '));
    }

    if(kDebugMode) {
      print(sb.toString());
    }

  }

  if(kDebugMode){
    // * Reusable styles
    final yourReusableStyle = RichStyle(italic: true, foreground: Colors.pinkAccent);
    printRich("Your Text", style: yourReusableStyle);
    printRich("Another Text", style: yourReusableStyle.copyWith(framed: true));

    // * Simple prints
    printRich("Background", background: Colors.green);
    printRich("Foreground", foreground: Colors.blue);
    printRich("Italic", italic: true);
    printRich("Bold", bold: true);
    printRich("Underline", underline: true);
    printRich("Invert",
        foreground: Colors.blue, background: Colors.green, invert: true);
    printRich("Invert",
        foreground: Colors.blue, background: const Color(0xffb74093), invert: true);
    printRich("Same as above but not inverted",
        foreground: Colors.blue, background: const Color(0xffb74093), invert: false);
    printRich("Strike", strike: true);
    printRich("DoubleUnderline", doubleUnderline: true);
    printRich("Framed", framed: true);
    printRich("Encircled", encircled: true);
    printError("Error");
    printWarning("Warning");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const StreetPastors(),
        });
  }
}

