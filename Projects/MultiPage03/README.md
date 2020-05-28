# MultiPage03

## Introduction

Goal here is to build a multi page app from scratch to get the hang of building a multi-page app.

Using [MultiPage02](../MultiPage02) as the basis for building this app

## Contents

- [MultiPage03](#multipage03)
  - [Introduction](#introduction)
  - [Contents](#contents)
  - [Author](#author)
  - [Date](#date)
  - [Initial App](#initial-app)

## Author

[philanderson888](https://github.com/philanderson888)

## Date

May 2020

## Initial App

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Screen"),
      ),
    );
  }
}
```

