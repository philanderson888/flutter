import 'package:flutter/material.dart';
import './random_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[100]),
      home: RandomWords()
    );
  }
}