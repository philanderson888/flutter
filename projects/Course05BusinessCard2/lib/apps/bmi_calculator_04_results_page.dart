import 'package:flutter/material.dart';
import '../constants.dart';

const footerHeight = 3;

// colors

const footerTextColor = Colors.white;
const footerFontWeight = FontWeight.w600;

// text
const containerTextSize = 30.0;
const footerTextSize = 21.0;
String appHeader = 'BMI Calculator';
String headerText = 'BMI CALCULATOR';
String footerText = 'RECALCULATE YOUR BMI';
String textMale = 'MALE';
String textFemale = 'FEMALE';
String textHeight = 'HEIGHT';
String textWeight = 'WEIGHT (kg)';
String textAge = "AGE";

class BmiResultsPage04 extends StatelessWidget {
  const BmiResultsPage04(
      {required this.bmi,
      required this.bmiResult,
      required this.bmiInterpretation});

  final String bmi;
  final String bmiResult;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 15,
            child: kBmiScoreHeader,
          ),
          Expanded(
            flex: 15,
            child: Text(bmiResult, style: kBmiResultsTextStyle),
          ),
          Expanded(
            flex: 15,
            child: Text(bmi, style: kTextStyleSize80ColorBEE4CB),
          ),
          Expanded(
            flex: 15,
            child: Container(
              child: Text(bmiInterpretation, style: kBmiResultsTextStyle),
            ),
          ),
          Expanded(
            flex: 10,
            child: GestureDetector(
              onTap: goBack,
              child: Container(
                color: const Color(0xff0D5411),
                child: const Center(
                  child: Text(
                    'RECALCULATE YOUR BMI',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
