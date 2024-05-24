// two buttons

// by chat gpt

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two Buttons By Chat GPT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _onButtonPressed(int buttonNumber) {
    debugPrint('You have clicked button $buttonNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Buttons By Chat GPT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onButtonPressed(1),
              child: Text('Button 1'),
            ),
            SizedBox(height: 20),  // Slight gap between buttons
            ElevatedButton(
              onPressed: () => _onButtonPressed(2),
              child: Text('Button 2'),
            ),
          ],
        ),
      ),
    );
  }
}
