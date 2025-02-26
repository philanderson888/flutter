// navigation two page stateless application

import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Multi Page Application"),
        ),
        body: Checkbox(
            value: false,
            onChanged: (bool? newValue) {
              Navigator.push(ctxt, MaterialPageRoute(
                    builder: (ctxt) => SecondScreen()
                ),
              ); // navigator.push
            } // onchanged
        )
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Multi Page Application Page-1"),
      ),
      body: new Text("Another Page...!!!!!!"),
    );
  }
}