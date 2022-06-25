import 'package:flutter/material.dart';

class ThemeCustom extends StatefulWidget {
  const ThemeCustom({Key? key}) : super(key: key);

  @override
  State<ThemeCustom> createState() => _ThemeCustomState();
}

class _ThemeCustomState extends State<ThemeCustom> {
  @override
  Widget build(BuildContext context) {
    doNothing() {
      print('doing nothing');
    }

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xff4C2973),
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.purple.shade400,
          ),
        ),
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: const Color(0xFF0a0d22),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4C2973)),
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
        floatingActionButton: FloatingActionButton(
          onPressed: doNothing,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
