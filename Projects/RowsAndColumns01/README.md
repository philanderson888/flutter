# RowsAndColumns01

## Author

Phil Anderson

## Date

May 2020

## Contents

- [RowsAndColumns01](#rowsandcolumns01)
  - [Author](#author)
  - [Date](#date)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Hello World with basic structure](#hello-world-with-basic-structure)
  - [Add images](#add-images)
  - [Very crude implementation](#very-crude-implementation)

## Introduction

This aims to display rows and columns using flutter

I am working this tutorial here https://medium.com/flutter-community/breaking-layouts-in-rows-and-columns-in-flutter-8ea1ce4c1316


## Hello World with basic structure

```java
import 'package:flutter/material.dart';
void main() => runApp(new MyApp());

class ChatItemScreen extends StatelessWidget{
  @override 
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Chat Item'),
        backgroundColor: Colors.lightGreen,
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
```

## Add images

```yaml
name: RowsAndColumns01
description: Display Rows And Columns
publish_to: 'none' 
version: 1.0.0+1
environment:
  sdk: ">=2.7.0 <3.0.0"
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.3
  url_launcher: ^5.4.0
dev_dependencies:
  flutter_test:
    sdk: flutter
flutter:
  uses-material-design: true
  assets:
     - assets/images/
```


## Very crude implementation

```java
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
```

