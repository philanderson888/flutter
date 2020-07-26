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
  - [Navigation](#navigation)
  - [Organising Items](#organising-items)
    - [Page](#page)
  - [Scaffold class](#scaffold-class)
    - [Scaffold with AppBar only](#scaffold-with-appbar-only)
  - [AppBar](#appbar)
  - [Navigation](#navigation-1)
  - [Organising Items](#organising-items-1)
    - [Drawer](#drawer)
    - [Themes](#themes)
  - [Containers](#containers)
    - [Body Is A Single Container](#body-is-a-single-container)
    - [body: Center( child:Container()  )  will fill the screen](#body-center-childcontainer--will-fill-the-screen)
    - [Container With Shadow](#container-with-shadow)
  - [Rows](#rows)
    - [Single Row With One Centred Item](#single-row-with-one-centred-item)
    - [Single Row With Multiple Children In The Row](#single-row-with-multiple-children-in-the-row)
    - [Single Row with Button Click](#single-row-with-button-click)
  - [Row And Column Layout](#row-and-column-layout)
  - [Text](#text)
    - [Center Justify Text](#center-justify-text)
    - [Text Styling](#text-styling)
    - [Text Styling With Themes For The Whole App](#text-styling-with-themes-for-the-whole-app)
    - [Text Styling With Theme](#text-styling-with-theme)
    - [Text Styling using `Flutter Color` VSCode plugin](#text-styling-using-flutter-color-vscode-plugin)
  - [Margins](#margins)
    - [Margin All Round](#margin-all-round)
    - [Margin Vertical](#margin-vertical)
    - [Margin Right](#margin-right)
  - [Padding](#padding)
  - [Buttons](#buttons)
    - [Generic Button](#generic-button)
    - [Raised Button](#raised-button)
    - [Rounded Button](#rounded-button)
    - [Button With Shadow (have to add to a container and apply the shadow to the container so see Container With Shadow section)](#button-with-shadow-have-to-add-to-a-container-and-apply-the-shadow-to-the-container-so-see-container-with-shadow-section)
    - [Button With Icon](#button-with-icon)
    - [Button With Icon 2](#button-with-icon-2)
    - [ButtonClick01](#buttonclick01)
    - [Button Click 2](#button-click-2)
  - [API HTTP GET](#api-http-get)

## Introduction

This repository is a place for learning Flutter.

## Why Flutter?

Flutter is good for building cross-platform apps quickly.  It also is incredibly popular.  When choosing a mobile app language one can choose

- ReactNative
- Flutter
- Kotlin

<p align="center><em>Flutter Popularity Compared To React Native</em></p>

<p align="center><img src="https://www.mindinventory.com/blog/wp-content/uploads/2020/04/cross-platform-mobile-frameworks.png" /></p>

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Page Application Page-1"),
      ),
      body: Text("Another Page...!!!!!!"),
    );
  }
}
```

## Navigation

see [MultiPage04](Projects/MultiPage04) for a demonstration of code which navigates 4 pages and back.

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
  AppBar
    Title
  Body
    Child
  FloatingActionButton
    onPressed
    tooltip
    child
```

### Scaffold with AppBar only

```java
class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Text('some text')
    );
  }
}
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


## Containers

Container must have a parent which is
- Center
- Padding
- Column
- Row
- Scaffold

By default container will fill the screen 

If it has a child the container will take up the width and height of the child



### Body Is A Single Container

```java
class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Container
        (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('some text'),
              Text('some more text').
            ],
          )
        ),
    );
  }
}
```

### body: Center( child:Container()  )  will fill the screen

*Note: container with a parent of Center by default will fill the screen*

```java
Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),   
      body: Center(
        child:Container(
          color: Colors.green,
        ),
      ),
    );
  }
```

### Container With Shadow

*Note : a button cannot have a shadow but must be put in a container which has a shadow*


```java
Container(
  decoration: BoxDecoration(
    boxShadow:[
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
  child: RaisedButton(
    autofocus: true,
    clipBehavior: Clip.none,
    onPressed: () => clickButton(),
    color: Colors.blue,
    padding: const EdgeInsets.all(30),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.lightBlue),
    ),
    child: Text(buttonText, 
        style: TextStyle(
          color: Colors.white,
          backgroundColor: Colors.blue,
        ),
      ),
  ),
),
```



## Rows

### Single Row With One Centred Item

```java
class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Container
        (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('some text'),
            ],
          )
        ),
    );
  }
}
```

### Single Row With Multiple Children In The Row

```java

class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Container
        (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('some text'),
              Text('some text'),
            ],
          )
        ),
    );
  }
}
```

### Single Row with Button Click

```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatefulHome(),
    );
  }
}
class StatefulHome extends StatefulWidget{
  UpdateStatefulHome createState() => UpdateStatefulHome();
}
class UpdateStatefulHome extends State{
  String buttonText = 'some text';
  int counter = 0;
  clickButton(){
    counter++;
    setState( () => {
      if(counter%2==0){
        buttonText = 'clicked'
      } else {
        buttonText = 'not clicked'
      }
    });
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Container
        (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('some text'),
              RaisedButton(
                autofocus: true,
                clipBehavior: Clip.none,
                onPressed: () => clickButton(),
                color: Colors.blue,
                child: Text(buttonText, 
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                  ),
              ),
              Text(counter.toString()),
            ],
          )
        ),
    );
  }
}
```

## Row And Column Layout

This layout has a container holding firstly a central column as a child, and inside the column we have children:Widget[] with containers inside them, and children inside them!

Not sure if this is the most efficient layout but it works!

```java
Widget build (BuildContext context) {
  return Scaffold(
    appBar: AppBar(    ),
    body: Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(             child: Text('here is some text'),             ),
          Container(              child: Text('here is some more text'),            ),
          Container(              child: Text('here is a third line'),            ),
        ],
      )
    ),
  );
}
```



```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatefulHome(),
    );
  }
}
class StatefulHome extends StatefulWidget{
  UpdateStatefulHome createState() => UpdateStatefulHome();
}
class UpdateStatefulHome extends State{
  String buttonText = 'some text';
  int counter = 0;
  clickButton(){
    counter++;
    setState( () => {
      if(counter%2==0){
        buttonText = 'clicked'
      } else {
        buttonText = 'not clicked'
      }
    });
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              child: Text('here is some text'),
            ),
            Container(
              child: Text('here is some more text'),
            ),
            Container(
              child: Text('here is a third line'),
            )
          ],
         )
      ),
    );
  }
}
```


## Text


```java
// left justified text
Text('some text')
```

### Center Justify Text

```java
class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Text('some text')
    );
  }
}
```
### Text Styling

```java
Text("BUTTON 2",
  style: new TextStyle(fontSize:12.0,
  color: const Color(0xFF000000),
  fontWeight: FontWeight.w200,
  fontFamily: "Roboto"),
)
```

### Text Styling With Themes For The Whole App

```java
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatefulHome(),
      theme: ThemeData(
        fontFamily: 'Georgia',
      ),
    );
  }
}
```


### Text Styling With Theme

Text is applied to a theme which applies to the whole app.

Different themes can be picked out and styled for individual components by choosing child elements of the theme

```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatefulHome(),
      theme: ThemeData(
        // applies to whole app if applied like this - fontFamily: 'Arial',
        accentColor: Colors.cyan[600],
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
class StatefulHome extends StatefulWidget{
  UpdateStatefulHome createState() => UpdateStatefulHome();
}
class UpdateStatefulHome extends State{
  String buttonText = 'some text';
  int counter = 0;
  clickButton(){
    counter++;
    setState( () => {
      if(counter%2==0){
        buttonText = 'Even'
      } else {
        buttonText = 'Odd'
      }
    });
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'here is some text',
                style:Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: Text(
                'here is some more text',
                style:Theme.of(context).textTheme.bodyText1,
              ),  
            ),
            Container(
              child: Text('here is a third line'),
            ),
          ],
         )
      ),
    );
  }
}
```

### Text Styling using `Flutter Color` VSCode plugin

```java
class MyApp extends StatelessWidget {
  final textBackground = Color(0xFFC4F3E0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatefulHome(),
      theme: ThemeData(
        // applies to whole app if applied like this - fontFamily: 'Arial',
        accentColor: Colors.cyan[600],
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 15,
            backgroundColor: textBackground,
            color: Color(0xFF2C0313),
          ),
        ),
      ),
    );
  }
}
```

## Margins

### Margin All Round

```java
Container(
  margin: const EdgeInsets.all(20),
  child: Text('some text'),
),
```

### Margin Vertical

```java
margin: EdgeInsets.symmetric(vertical:10.0),
```

### Margin Right

```java
Container(
  margin: const EdgeInsets.only(right:10.0),
  child: Text('some text'),
),
```


## Padding

```java
padding: const EdgeInsets.all(30),
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

### Rounded Button

```java
RaisedButton(
  autofocus: true,
  clipBehavior: Clip.none,
  onPressed: () => clickButton(),
  color: Colors.blue,
  padding: const EdgeInsets.all(30),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
    side: BorderSide(color: Colors.lightBlue),
  ),
  child: Text(buttonText, 
      style: TextStyle(
        color: Colors.white,
        backgroundColor: Colors.blue,
      ),
    ),
),
```

### Button With Shadow (have to add to a container and apply the shadow to the container so see [Container With Shadow](#container-with-shadow) section)

### Button With Icon

```java
Container(
  child: RaisedButton.icon(
    onPressed: () => clickButton(),
    icon: Icon(Icons.arrow_forward), 
    label: Text('a button'),
  ),
),
```

### Button With Icon 2

```java
Container(
  width:250,
  child: RaisedButton(
    onPressed: () => clickButton(),
    child: Row(
      children: <Widget>[
        Text("Click To Go To Next Page"),
        Icon(Icons.arrow_forward),
      ],
    ),
  ),
),
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

### Button Click 2

```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatefulHome(),
    );
  }
}
class StatefulHome extends StatefulWidget{
  UpdateStatefulHome createState() => UpdateStatefulHome();
}
class UpdateStatefulHome extends State{
  String buttonText = 'some text';
  int counter = 0;
  clickButton(){
    counter++;
    setState( () => {
      if(counter%2==0){
        buttonText = 'clicked'
      } else {
        buttonText = 'not clicked'
      }
    });
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Container
        (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('some text'),
              RaisedButton(
                autofocus: true,
                clipBehavior: Clip.none,
                onPressed: () => clickButton(),
                color: Colors.blue,
                child: Text(buttonText, 
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                  ),
              ),
              Text(counter.toString()),
            ],
          )
        ),
    );
  }
}
```


## API HTTP GET

This gets a single piece of API data

It also decodes and prints whole list, both to the screen and console.

```java
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> fetchAlbums() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('server returned response of 200 with fetchAlbums()');
    var jsonOutput = json.decode(response.body);
    print('yes we got jsonOutput');
    List<Album> list;
    list = (json.decode(response.body) as List)
      .map( (album) => Album.fromJson(album)).toList();
    print('yes we obtained a list');       
    // // List<Album>.from(jsonOutput)
    // //   .map((Map model) => Album.fromJson(model)).toList();
    // final List<Album> list = json.decode(response.body)['result']
    //   .map((data) => Album.fromJson(data))
    //   .toList();
    var listLength = list.length;
    print('list length is $listLength');
    for(var item in list){
      print('i am an item in a list');
      print(item.title);
    }
    return list;
    //return Album.fromJson(json.decode(response.body));
  } else {
    print('something went wrong');
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // holds one album
  Future<Album> futureAlbum;
  // holds list of albums
  Future<List<Album>> futureAlbums;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureAlbums = fetchAlbums();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String output = snapshot.data.title;
                    return Text('data read is - - $output');
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
              Text('Above is just one item; below are all items read from JSON API'),
              FutureBuilder<List<Album>>(
                future:futureAlbums,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    List<Album> dataList = snapshot.data;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 10; i++) Text(dataList[i].title)
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
