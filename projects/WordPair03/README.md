# WordPair03

## Author

Philip Anderson

## Date

May 2020

## Contents

- [WordPair03](#wordpair03)
  - [Author](#author)
  - [Date](#date)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Install And Run](#install-and-run)
  - [launch.json](#launchjson)
  - [Base Project](#base-project)
  - [Add button](#add-button)
  - [Input text](#input-text)
  - [Reading And Acting On The Value In A Text Field](#reading-and-acting-on-the-value-in-a-text-field)
  - [Add an image](#add-an-image)
    - [map \assets\images in pubspec.yaml](#map-assetsimages-in-pubspecyaml)
    - [Add image](#add-image)
    - [Add clickable URL](#add-clickable-url)
      - [Add `url_launcher` from `pub.dev` to `pubspec.yaml`](#add-url_launcher-from-pubdev-to-pubspecyaml)
  - [Clear out whole app `main.dart`](#clear-out-whole-app-maindart)
  - [Hello World with Centred Text](#hello-world-with-centred-text)
  - [`AppBar` with `Scaffold`](#appbar-with-scaffold)
  - [Word Pairs](#word-pairs)
  - [Create a row (incorrectly!) with multiple items in one row](#create-a-row-incorrectly-with-multiple-items-in-one-row)

## Introduction

This is a series of Flutter projects following [@TraversyMedia](https://www.youtube.com/channel/UC29ju8bIPH5as8OGnQzwJyA) just to get an app up and running using Flutter and Dart.

The YouTube link is here https://www.youtube.com/watch?v=1gDhl4leEzA

The goal of the app is to create a list of random word pairs which can be 'liked'

Happy Days!

## Install And Run

```java
// check no errors
flutter doctor
flutter create WordPair03;cd WordPair03;flutter run
// also 
Control-F5
```

## launch.json

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Dart",
            "program": "c:/github/flutter/Projects/WordPair03/lib/main.dart",
            "request": "launch",
            "type": "dart"
        }
    ]
}
```

## Base Project

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

## Add button

```java
// field
String dropdownValue = 'One';
// method
void _increment(int increment){
    setState((){
    _counter += increment;
    });
} 
// buttons
FlatButton(
    onPressed: _incrementCounter,
    child: Text(
    "Flat Button",
    ),
),
IconButton(
    icon: Icon(Icons.volume_up),
    tooltip: 'Increase volume by 10',
    onPressed: () => _increment(10),
),
FloatingActionButton(
    onPressed: _incrementCounter,
    tooltip: 'Increment And Add One',
    child: Icon(Icons.phone_forwarded),
), 
DropdownButton<String>(
    items: <String>['One', 'Two', 'Three', 'Four']
    .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
        );
    })
    .toList(),
    icon: Icon(Icons.arrow_downward),
    onChanged: (String newValue) {
    setState(() {
        dropdownValue = newValue;
        switch (newValue){
        case "One":
            _increment(1);
            break;
        case "Two":
            _increment(2);
            break;
        case "Three":
            _increment(3);
            break;
        case "Four":
            _increment(4);
            break;
        default:
            break;
        }
    });
    },
    value: dropdownValue,
    iconSize: 24,
    elevation: 16,
    style: TextStyle(color: Colors.deepPurple),
),
```

## Input text

```java
TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Name',
    ),
)
```

## Reading And Acting On The Value In A Text Field

We have to add a controller and a listener to the text field.  In this case I am acting on every change of the value in the text field.  

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
  String dropdownValue = 'One';
  final myController = TextEditingController();
  void initState(){
    super.initState();
    myController.addListener(_printLatestValue);
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _increment(int increment){
    setState((){
      _counter += increment;
    });
  }
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  void _printLatestValue() {
    print("Input value has changed to ${myController.text}");
    var increment = int.tryParse(myController.text);
    if (increment == null){
      increment = 1;
    }
    _increment(increment);
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
            FlatButton(
              onPressed: _incrementCounter,
              child: Text(
                "Flat Button",
              ),
            ),
            ElevatedButton(
              onPressed: () => _increment(2),
              child: const Text(
                'Raised Button',
                style: TextStyle(fontSize: 20)
              ),
            ),
            IconButton(
              icon: Icon(Icons.volume_up),
              tooltip: 'Increase volume by 10',
              onPressed: () => _increment(10),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment And Add One',
              child: Icon(Icons.phone_forwarded),
            ), 
            DropdownButton<String>(
              items: <String>['One', 'Two', 'Three', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                .toList(),
              icon: Icon(Icons.arrow_downward),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                 switch (newValue){
                    case "One":
                      _increment(1);
                      break;
                    case "Two":
                      _increment(2);
                      break;
                    case "Three":
                      _increment(3);
                      break;
                    case "Four":
                      _increment(4);
                      break;
                    default:
                      break;
                  }
                });
              },
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
            ),
            TextField(
                controller: myController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quantity',
              ),
            )
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

## Add an image

### map \assets\images in pubspec.yaml

```yaml
name: WordPair03
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
  assets:
     - assets/images/
```

### Add image

```java
Image.asset(
    'assets/images/videogame.png',
    width: 100,
    height: 50,
    //fit: BoxFit.fill,
),
```

### Add clickable URL

#### Add `url_launcher` from `pub.dev` to `pubspec.yaml`

```yaml
url_launcher: ^5.4.0
```

```java
import 'package:url_launcher/url_launcher.dart';
void _launchURL(String url) async {
    if(await canLaunch(url)){
        await launch(url);
    } else {
        throw 'Could not launch $url';
    }
}
ElevatedButton(
    onPressed: () => _launchURL('https://www.bbc.co.uk'),
    child: Text(
    'Click to go to BBC website',
    ),
),
```

## Clear out whole app `main.dart`

Clearing out the whole app and starting again from scratch

```java
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  String dropdownValue = 'One';
  final myController = TextEditingController();
  void initState(){
    super.initState();
    myController.addListener(_printLatestValue);
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _increment(int increment){
    setState((){
      _counter += increment;
    });
  }
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  void _printLatestValue() {
    print("Input value has changed to ${myController.text}");
    var increment = int.tryParse(myController.text);
    if (increment == null){
      increment = 1;
    }
    _increment(increment);
  }
  void _launchURL(String url) async {
    if(await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
              'You have pushed the button this many times: $_counter',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://www.bbc.co.uk'),
              child: Text(
                'Click to go to BBC website',
              ),
            ),
            ElevatedButton(
              onPressed: () => _increment(2),
              child: const Text(
                'Raised Button',
                style: TextStyle(fontSize: 20)
              ),
            ),
            IconButton(
              icon: Icon(Icons.volume_up),
              tooltip: 'Increase volume by 10',
              onPressed: () => _increment(10),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment And Add One',
              child: Icon(Icons.phone_forwarded),
            ), 
            DropdownButton<String>(
              items: <String>['One', 'Two', 'Three', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                .toList(),
              icon: Icon(Icons.arrow_downward),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                 switch (newValue){
                    case "One":
                      _increment(1);
                      break;
                    case "Two":
                      _increment(2);
                      break;
                    case "Three":
                      _increment(3);
                      break;
                    case "Four":
                      _increment(4);
                      break;
                    default:
                      break;
                  }
                });
              },
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
            ),
            TextField(
                controller: myController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quantity',
              ),
            ),
            Image.asset(
              'assets/images/videogame.png',
              width: 100,
            height: 50,
    //fit: BoxFit.fill,
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

## Hello World with Centred Text

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: Text('Hello World', 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          color: Colors.green[200],
        )
      )
    );
  }
}
```

## `AppBar` with `Scaffold`

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[100]),
      home: Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
        ),
      )
    );
  }
}
```

## Word Pairs

```yaml
english_words: ^3.1.5
```

```java
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[100]),
      home: Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase)
        ),
      )
    );
  }
}
```

## Create a row (incorrectly!) with multiple items in one row

```java
return MaterialApp(
    theme: ThemeData(primaryColor: Colors.purple[100]),
    home: Scaffold(
    appBar: AppBar(
        title: Text('WordPair Generator'),
    ),
    body: new Container(
        child: new Row(
        children: <Widget>[
            Center(
            child: Text(wordPair.asPascalCase)
            ),
            Center(
            child: Text(wordPair.asPascalCase)
            ),
            Center(
            child: Text(wordPair.asPascalCase)
            ),
            Text('Hello World', 
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: Colors.green[200],
            ),
            ),
        ],
        ),
    ),
)
```


