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
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: 300,
            height: 300,
            color: Colors.red,
            child: Text('an app',
                style: TextStyle(
                  backgroundColor: Colors.white,
                )),
          ),
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
