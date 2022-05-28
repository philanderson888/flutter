import 'package:flutter/material.dart';
// based on https://dribbble.com/shots/4585382-Simple-BMI-Calculator
// two colour from this app are background #090C21 container #1D1F33

class BmiCalculator02 extends StatefulWidget {
  const BmiCalculator02({Key? key}) : super(key: key);

  @override
  State<BmiCalculator02> createState() => _BmiCalculator02State();
}

class _BmiCalculator02State extends State<BmiCalculator02> {
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
            color: Colors.purple.shade400,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF0a0d22),
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.yellow),
          headline3: TextStyle(color: Colors.yellow),
          bodyText2: TextStyle(color: Colors.purple),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff4C2973),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator 2'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Color(0xff0D5411),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Center(
                      child: Text(
                        'BMI CALCULATOR 2',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Color(0xff0D5411),
                    ),
                  ),
                ],
              ),
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
              child: Container(
//                color: Color(0xff05060C),
                color: Color(0xff0D5411),
                child: Center(
                  child: Text(
                    'CALCULATE YOUR BMI',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
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
          data: const IconThemeData(color: Colors.purple),
        ),
      ),
    );
  }
}
