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
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  padding: const EdgeInsets.all(20),
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: Colors.red,
                  ),
                  child: Text(
                    'box 1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      backgroundColor: Colors.green.shade300,
                      color: Colors.blueGrey.shade900,
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  padding: const EdgeInsets.all(20),
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: Colors.red,
                  ),
                  child: Text(
                    'box 2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      backgroundColor: Colors.green.shade300,
                      color: Colors.blueGrey.shade900,
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  padding: const EdgeInsets.all(20),
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: Colors.red,
                  ),
                  child: Text(
                    'box 3',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      backgroundColor: Colors.green.shade300,
                      color: Colors.blueGrey.shade900,
                      fontSize: 40,
                    ),
                  ),
                ),
              ]),
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
