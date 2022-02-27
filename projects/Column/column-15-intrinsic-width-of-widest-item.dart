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
          child: IntrinsicWidth(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                    padding: const EdgeInsets.all(20),
                    height: 100,
                    width: 100,
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                    padding: const EdgeInsets.all(20),
                    width: 500,
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                    padding: const EdgeInsets.all(20),
                    height: 100,
                    width: 700,
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
                  Container(
                    width: double.infinity,
                    height: 10,
                  ),
                ]),
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
