# ListView03

## Introduction

This continues straight from [ListView02](../ListView02)

That had reached an exciting stage of displaying cards and each card had two columns in it.

## Contents

- [ListView03](#listview03)
  - [Introduction](#introduction)
  - [Contents](#contents)
  - [Add icons at the end of each row](#add-icons-at-the-end-of-each-row)


## Add icons at the end of each row

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('ListViews')),
        body: BodyLayout(),
      ),
    );
  }
}
class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}
Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Sun'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
            print('Sun');
        },
      ),
      ListTile(
        title: Text('Moon'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
            print('Moon');
        },
      ),
      ListTile(
        title: Text('Star'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
            print('Star');
        },
      ),
    ],
  );
}
```