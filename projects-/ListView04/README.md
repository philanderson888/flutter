# ListView04

## Introduction

Builds on ListView01, 02 and 03

## Contents

- [ListView04](#listview04)
  - [Introduction](#introduction)
  - [Contents](#contents)
  - [Adding clickable columns in a ListView](#adding-clickable-columns-in-a-listview)


## Adding clickable columns in a ListView

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
  Widget column = Expanded(
    child: Column(
      // align the text to the left instead of centered
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Title', style: TextStyle(fontSize: 16),),
        Text('subtitle'),
      ],
    ),
  );
  return ListView.builder(
    itemBuilder: (context, index) {
      return Card(
        child: InkWell(
          onTap: () {
            print('tapped');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                column,
                column,
              ],
            ),
          ),
        ),
      );
    },
  );
}
```