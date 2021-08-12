import 'package:flutter/material.dart';
void main() => runApp(new MyApp());

class ChatItemScreen extends StatelessWidget{
  final leftSection = new Container(
    height: 50.0,
    child: new CircleAvatar(
      backgroundImage: new NetworkImage('https://i.ya-webdesign.com/images/avatar-png-1.png'),
      backgroundColor: Colors.lightGreen,
      radius: 24.0,
    ),
  );
  final middleSection = new Expanded(
    child: new Container(
      height: 100.0,
      padding: new EdgeInsets.only(left: 8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Text("Phil Anderson",
            style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
            ),),
          new Text("Hi what's up???", style:
            new TextStyle(color: Colors.grey),),
        ],
      ),
    ),
  );
  final rightSection = new Container(
    height: 100.0,
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Text("9:50",
            style: new TextStyle(
              color: Colors.lightGreen,
            fontSize: 12.0),),
        new CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 20.0,
          child: new Text("42",
          style: new TextStyle(color: Colors.green,
          fontSize: 12.0),),
        )
      ],
    ),
  );
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Container(
        child: new Row(
          children: <Widget>[
            leftSection,
            middleSection,
            rightSection
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new ChatItemScreen(), //calling chat_screen_item.dart
    );
  }
}