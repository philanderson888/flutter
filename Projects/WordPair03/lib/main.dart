import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[100]),
      home: Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
        ),
        body: new Container(
          child: new Row(
            children: <Widget>[
              Center(
                child: Text(wordPair.asPascalCase)
              ),
              Center(
                child: Text(wordPair.asPascalCase)
              ),
              Center(
                child: Text(wordPair.asPascalCase)
              ),
              Text('Hello World', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green[200],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}