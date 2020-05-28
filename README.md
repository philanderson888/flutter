# Flutter

## Author

Philip Anderson 

## Creation Date

May 2020

## Contents

- [Flutter](#flutter)
  - [Author](#author)
  - [Creation Date](#creation-date)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Projects](#projects)
  - [Flutter Studio at https://flutterstudio.app](#flutter-studio-at-httpsflutterstudioapp)
  - [Starter Code](#starter-code)
    - [yaml](#yaml)
    - [default scaffolding](#default-scaffolding)
    - [Default Clean Screen](#default-clean-screen)
    - [Default Layout For Two Basic Pages](#default-layout-for-two-basic-pages)
  - [Organising Items](#organising-items)
    - [Page](#page)
  - [Scaffold class](#scaffold-class)
  - [AppBar](#appbar)
  - [Navigation](#navigation)
  - [Organising Items](#organising-items-1)
    - [Drawer](#drawer)
    - [Themes](#themes)
  - [Buttons](#buttons)
    - [Generic Button](#generic-button)
    - [Raised Button](#raised-button)
  - [Text](#text)
    - [ButtonClick01](#buttonclick01)

## Introduction

This repository is a place for learning Flutter.

## Projects

This is where I am building all of my compiled projects

[Projects](Projects)

## [Flutter Studio at https://flutterstudio.app](https://flutterstudio.app)

This can be used to quickly scaffold code for us without manual typing.

Wow!

## Starter Code

### yaml

```yaml
name: MultiPage01
description: A new Flutter project.
publish_to: 'none' 
version: 1.0.0+1
environment:
  sdk: ">=2.7.0 <3.0.0"
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.3
dev_dependencies:
  flutter_test:
    sdk: flutter
flutter:
  uses-material-design: true
```

### default scaffolding

```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
```

### Default Clean Screen

```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
    );
  }
}
```


### Default Layout For Two Basic Pages

```java
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Multi Page Application"),
      ),
      body: new Checkbox(
          value: false,
          onChanged: (bool newValue) {
            Navigator.push(
              ctxt,
              new MaterialPageRoute(
                builder: (ctxt) => new SecondScreen()
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
```



## Organising Items 

```
Scaffold
  Drawer
    Items 
```

### Page

```
Scaffold

  AppBar
    Title

  Body
    Child

  FloatingActionButton
    onPressed
    tooltip
    child
```



## Scaffold class 

This class implements the basic visual structure of the code

`Scaffold` shows

- drawers
- snack bars
- bottom sheets


```
Scaffold

  AppBar
    Title

  Body
    Child

  FloatingActionButton
    onPressed
    tooltip
    child
```

## AppBar

Appears at the top of the screen

```java
appBar: AppBar(
  backgroundColor: Theme.of(ctx).canvasColor,
  elevation:1.0,
),
```




## Navigation

Navigation uses tabs and drawers.

Route - tells us where to go from now

Stack - keeps track of navigation so far and how to go back

## Organising Items 

```
Scaffold
  Drawer
    Items 
```
Drawer can be closed programatically

### [Drawer](Projects/Drawer01)

A drawer is like a menu drop-down item

### Themes

Themes can be used to set colours

```java
// create
final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightGreenAccent,
);
// use
backgroundColor: Theme.of(ctx).canvasColor,
```

## Buttons

### Generic Button

```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  @override
  void buttonPressed(){}
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: RaisedButton(
          key:null, 
          onPressed:buttonPressed,
          color: const Color(0xFFe0e0e0),
          child: Text("Button")
        ),
      ),
    );
  }
}
class Page1 extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
    );
  }
}
```

### Raised Button

```java
body: RaisedButton(
  key:null, 
  onPressed:buttonPressed,
  color: const Color(0xFFe0e0e0),
  child:
    new Text(
    "BUTTON",
      style: new TextStyle(fontSize:12.0,
      color: const Color(0xFF000000),
      fontWeight: FontWeight.w200,
      fontFamily: "Roboto"),
    )
  ),


void buttonPressed(){}
```

## Text

```
Text("BUTTON 2",
  style: new TextStyle(fontSize:12.0,
  color: const Color(0xFF000000),
  fontWeight: FontWeight.w200,
  fontFamily: "Roboto"),
)

```

### [ButtonClick01](ButtonClick01)

```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UpdateButton(),
    );
  }
}
class UpdateButton extends StatefulWidget{
  UpdateButtonState createState() => UpdateButtonState();
}
class UpdateButtonState extends State{
  String textHolder = 'Old Sample Text';
  changeText(){
    setState(() {
      textHolder = 'New Sample Text';
    });
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: new RaisedButton(
          key:null, 
          onPressed: () => changeText(),
          color: const Color(0xFFe0e0e0),
          child: Text('$textHolder')
        ),
      ),
    );
  }
}
class Page1 extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
    );
  }
}
```