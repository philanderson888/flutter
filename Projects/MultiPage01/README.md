# MultiPage01

## Contents

- [MultiPage01](#multipage01)
  - [Contents](#contents)
  - [Author](#author)
  - [Date](#date)
  - [Introduction](#introduction)
  - [Getting Started and removing all comments](#getting-started-and-removing-all-comments)
  - [Not quite done yet](#not-quite-done-yet)

## Author

Philip Anderson

## Date

May 2020

## Introduction

This is looking at building a multiple page document in flutter.

Looking at this video https://www.youtube.com/watch?v=b2fgMCeSNpY

*Note: [Drawer01](../Drawer01) also does this same functionality so check that out also*

## Getting Started and removing all comments

```java
flutter create MultiPage01;cd MultiPage01;code README.md;flutter run
```

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

```java
import 'package:flutter/material.dart';
void main() {
  runApp(App());
}
class App extends StatelessWidget {
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

## Not quite done yet

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

// create a colour 
final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightGreenAccent,
  accentColor: Colors.redAccent,
);

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext ctx){
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: (){
            //Navigator.push(ctx,PageTwo());
          },
          child:Text('Go to page 2')
        ),
      ),
    );
  }
}

// Material Page Route allows us to replace the screen with new transitional screen
// on button click go to new page but original page stays in memory 
// can remove from memory by setting maintain state = false
// null means route returns nothing as there is no state to return
class PageTwo extends MaterialPageRoute<Null>{
  // constructor - can pass in items if we want 
  PageTwo(): super(builder:(BuildContext ctx){
    // return element we are creating
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(ctx).canvasColor,
        elevation:1.0,
      ),
      body:Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(
              ctx,
              PageThree()
            );
          },
          child: Text('Go to page 3'),
        ),
      ),
    );
  });
}


class PageThree extends MaterialPageRoute<Null>{
  // constructor - can pass in items if we want 
  PageThree(): super(builder:(BuildContext ctx){
    // return element we are creating
    return Scaffold(
      appBar: AppBar(
        title: Text('last page'),
        backgroundColor: Theme.of(ctx).accentColor,
        elevation:2.0,
        actions: <Widget>[
           IconButton(
             icon: Icon(Icons.close),
             onPressed: (){
               Navigator.pop(ctx);
             },
           ),
        ],
      ),
      body:Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.popUntil(
              ctx, 
              ModalRoute.withName(Navigator.defaultRouteName)
            );
          },
          child: Text('Go Home!'),
        ),
      ),
    );
  });
}
```