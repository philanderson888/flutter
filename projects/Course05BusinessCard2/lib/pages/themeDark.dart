import 'package:flutter/material.dart';

class ThemeDark extends StatefulWidget {
  const ThemeDark({Key? key}) : super(key: key);

  @override
  State<ThemeDark> createState() => _ThemeDarkState();
}

class _ThemeDarkState extends State<ThemeDark> {
  @override
  Widget build(BuildContext context) {
    doNothing() {
      print('doing nothing');
    }

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Dark'),
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
