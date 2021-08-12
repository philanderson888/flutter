# MultiPage02

## Contents

- [MultiPage02](#multipage02)
  - [Contents](#contents)
  - [Author](#author)
  - [Date](#date)
  - [Introduction](#introduction)
  - [Page 1](#page-1)
  - [Add second screen](#add-second-screen)
  - [Link first to second screen with an `action`](#link-first-to-second-screen-with-an-action)
  - [Complete multi-page app!](#complete-multi-page-app)

## Author

[Phil Anderson](https://github.com/philanderson888)

## Date

May 2020

## Introduction 

Building a multipage flutter application

https://proandroiddev.com/flutter-creating-multi-page-application-with-navigation-ef9f4a72d181

## Page 1

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
          onChanged: null
      )
    );
  }
}
```

## Add second screen

```java
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

## Link first to second screen with an `action`

Route - tells us where to go from now

Stack - keeps track of navigation so far and how to go back

```java
onChanged: (bool newValue) {
  Navigator.push(
    ctxt,
    new MaterialPageRoute(builder: (ctxt) => new SecondScreen()),
  );
}
```

## Complete multi-page app!

This has forward and back motions!

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