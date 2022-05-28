import 'package:flutter/material.dart';

class ThemeLight extends StatefulWidget {
  const ThemeLight({Key? key}) : super(key: key);

  @override
  State<ThemeLight> createState() => _ThemeLightState();
}

class _ThemeLightState extends State<ThemeLight> {
  @override
  Widget build(BuildContext context) {
    doNothing() {
      print('doing nothing');
    }

    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Light'),
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
                  'This is text on a light theme',
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
