import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';

class BmiCalculator01 extends StatefulWidget {
  const BmiCalculator01({Key? key}) : super(key: key);

  @override
  State<BmiCalculator01> createState() => _BmiCalculator01State();
}

class _BmiCalculator01State extends State<BmiCalculator01> {
  @override
  Widget build(BuildContext context) {
    doNothing() {
      print('doing nothing');
    }

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xff4C2973),
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: kPurple400,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF0a0d22),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: kPurple),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff4C2973),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            const Expanded(
              flex: 7,
              child: Center(
                child: Text(
                  'This is text on a dark theme',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
        floatingActionButton: IconTheme(
          child: FloatingActionButton(
            onPressed: doNothing,
            child: const Icon(
              Icons.add,
              color: Color(0xffab47bc),
            ),
          ),
          data: IconThemeData(color: kPurple),
        ),
      ),
    );
  }
}
