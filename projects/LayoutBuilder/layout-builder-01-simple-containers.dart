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
          title:
              Text('Layout Builder uses fractions of screen width and height '),
        ),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(children: [
              Container(
                  color: Colors.lightGreen.shade100,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight / 3),
              Container(
                  color: Colors.cyan.shade200,
                  width: constraints.maxWidth / 2,
                  height: constraints.maxHeight / 6),
              Container(
                  color: Colors.tealAccent.shade200,
                  width: constraints.maxWidth / 3,
                  height: constraints.maxHeight / 4),
            ]);
          }),
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
