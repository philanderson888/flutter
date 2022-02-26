import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade300,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade600,
        ),
        body: Container(
          child: Text('an app'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.shade800,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
