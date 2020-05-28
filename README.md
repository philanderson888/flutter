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
  - [Navigation](#navigation)
    - [Default Layout For Two Basic Pages](#default-layout-for-two-basic-pages)
  - [Organising Items](#organising-items)
    - [Page](#page)
  - [Scaffold class](#scaffold-class)
  - [AppBar](#appbar)
  - [Navigation](#navigation-1)
  - [Organising Items](#organising-items-1)
    - [Drawer](#drawer)
    - [Themes](#themes)

## Introduction

This repository is a place for learning Flutter.

## Projects

This is where I am building all of my compiled projects

[Projects](Projects)

## [Flutter Studio at https://flutterstudio.app](https://flutterstudio.app)

This can be used to quickly scaffold code for us without manual typing.

Wow!

## Navigation

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

