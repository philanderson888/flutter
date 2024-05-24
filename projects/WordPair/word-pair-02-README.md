# WordPair02

## Author

[Philip Anderson](https://github.com/philanderson888)

## Date

May 2020

## Contents

- [WordPair02](#wordpair02)
  - [Author](#author)
  - [Date](#date)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Install](#install)
  - [Verify](#verify)
  - [Application Overview](#application-overview)
  - [Create app with `flutter create`](#create-app-with-flutter-create)
  - [Run App by updating `launch.json`](#run-app-by-updating-launchjson)
  - [WordPair02](#wordpair02-1)
    - [Install](#install-1)
    - [Hot Reload with `r`](#hot-reload-with-r)
  - [Run the app using VSCode](#run-the-app-using-vscode)
  - [Application Overview](#application-overview-1)
  - [Create app with `flutter create`](#create-app-with-flutter-create-1)
  - [Run App with `hot reload` by updating `launch.json`](#run-app-with-hot-reload-by-updating-launchjson)
  - [Buttons](#buttons)
  - [Images](#images)
    - [pubspec.yaml](#pubspecyaml)
    - [main.dart](#maindart)
  - [Buttons, Dropdowns, Labels And Text Items](#buttons-dropdowns-labels-and-text-items)
  - [Layouts](#layouts)
  - [MaterialApp class](#materialapp-class)
  - [Scaffold Widget is a high level widget](#scaffold-widget-is-a-high-level-widget)
  - [Clear Out App](#clear-out-app)
  - [Hello World](#hello-world)
  - [Create an `AppBar` with `Scaffold` class](#create-an-appbar-with-scaffold-class)
  - [Change color of AppBar](#change-color-of-appbar)
  - [Add Plain Text Child Widget](#add-plain-text-child-widget)
  - [Add English Words](#add-english-words)
    - [add `english_words` library from `pub.dev`](#add-english_words-library-from-pubdev)
    - [Generate Random Word Pairs](#generate-random-word-pairs)
  - [Refactor To Put Code In Class](#refactor-to-put-code-in-class)
  - [Add ListView](#add-listview)

## Introduction

This is a sequence of projects following [Traversy Media](https://www.youtube.com/channel/UC29ju8bIPH5as8OGnQzwJyA) building a flutter application using Dart.  The YouTube link is [https://www.youtube.com/watch?v=1gDhl4leEzA](https://www.youtube.com/watch?v=1gDhl4leEzA).

If you're following, have fun!

## Install

1. Android Studio https://developer.android.com/studio
2. Flutter https://flutter.dev/ 
3. Flutter SDK https://flutter.dev/docs/get-started/install/windows
4. Unzip Flutter ZIP file at F:\ 
5. Add F:\flutter\bin to PATH
   
## Verify

```js
flutter doctor
flutter doctor --android-licenses
```

1. Android Studio - Install the `flutter` plugin
2. Attach an Android device and allow USB debugging on it for this machine (follow the prompts which may take up to a minute to show, in sequence as there are several messages which appear, the last one being the USB debugging one)

Continue until `flutter doctor` shows all ticks

![flutter-doctor.png](flutter-doctor.png)

## Application Overview

Goal of the application is to generate `WordPairs` which can be used for usernames or servernames.  We can also `like` favourite icons and also we can have a menu which drops down and allows us to select another page to view `liked` icons.

## Create app with `flutter create`

```js
flutter create WordPair01
```

## Run App by updating `launch.json`

The app runs fine from Android Studio.

However it's not running by default from VSCode but demands a path to the file `lib\main.dart` which is the entry point to the program.

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Dart",
            "program": "c:/github/flutter/projects/WordPair01/lib/main.dart",
            "request": "launch",
            "type": "dart"
        }
    ]
}
```



## WordPair02

### Install

```js
flutter create WordPair02
cd WordPair02
flutter run
```

Project now runs on Android tablet.

### Hot Reload with `r`

Hitting `r` will reload the app

```js
flutter run
r
r
r
```

## Run the app using VSCode

In the root of your VSCode tree modify the `launch.json` file to point to your `lib/main.dart` file

```json
# WordPair01

## Introduction

This is a sequence of projects following [Traversy Media](https://www.youtube.com/channel/UC29ju8bIPH5as8OGnQzwJyA) building a flutter application using Dart.  The YouTube link is [https://www.youtube.com/watch?v=1gDhl4leEzA](https://www.youtube.com/watch?v=1gDhl4leEzA).

If you're following, have fun!

## Install

1. Android Studio https://developer.android.com/studio
2. Flutter https://flutter.dev/ 
3. Flutter SDK https://flutter.dev/docs/get-started/install/windows
4. Unzip Flutter ZIP file at F:\ 
5. Add F:\flutter\bin to PATH
   
## Verify

```js
flutter doctor
flutter doctor --android-licenses
```

1. Android Studio - Install the `flutter` plugin
2. Attach an Android device and allow USB debugging on it for this machine (follow the prompts which may take up to a minute to show, in sequence as there are several messages which appear, the last one being the USB debugging one)

Continue until `flutter doctor` shows all ticks

![flutter-doctor.png](flutter-doctor.png)

## Application Overview

Goal of the application is to generate `WordPairs` which can be used for usernames or servernames.  We can also `like` favourite icons and also we can have a menu which drops down and allows us to select another page to view `liked` icons.

## Create app with `flutter create`

```js
flutter create WordPair01
```

## Run App with `hot reload` by updating `launch.json`

The app runs fine from Android Studio.

However it's not running by default from VSCode but demands a path to the file `lib\main.dart` which is the entry point to the program.

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Dart",
            "program": "c:/github/flutter/projects/WordPair01/lib/main.dart",
            "request": "launch",
            "type": "dart"
        }
    ]
}
```

VSCode will now run the app with `hot reload` running

## Buttons

We can now get a variety of buttons to run in our app.

Let's have a look!

```java
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button too many times :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'You have pushed the counter button too many times, $_counter to be exact :',
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
            IconButton(
              icon: Icon(Icons.volume_up),
              tooltip: 'Increase volume by 10',
              onPressed: _incrementCounter,
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text(
                'Raised Button',
                style: TextStyle(fontSize: 20)
              ),
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
                });
              },
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment And Add One',
        child: Icon(Icons.phone_forwarded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

```

## Images

create assets/images/ folder in the root of your project directory

### pubspec.yaml

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

### main.dart

```java
Image.asset(
  'assets/images/mountain.jpg',
),
```

## Buttons, Dropdowns, Labels And Text Items

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

  void _incrementCounter([int increment = 1]) {
    setState(() {
      _counter += increment;
    });
  }
String dropdownValue = 'One';
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
              'You have pushed the button too many times :',
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
            IconButton(
              icon: Icon(Icons.volume_up),
              tooltip: 'Increase volume by 10',
              onPressed: _incrementCounter,
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text(
                'Raised Button',
                style: TextStyle(fontSize: 20)
              ),
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
                      _incrementCounter(1);
                      break;
                    case "Two":
                      _incrementCounter(2);
                      break;
                    case "Three":
                      _incrementCounter(3);
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
            // Image.asset(
            //   'assets/images/mountain.jpg',
            //   fit: BoxFit.cover,
            // ),
            FlatButton(
              onPressed: _incrementCounter,
              child: Text(
                "Flat Button",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            )
            // Image.asset(
            //   'assets/images/mountain.jpg',
            //   fit: BoxFit.fitWidth,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment And Add One',
        child: Icon(Icons.phone_forwarded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

```


## Layouts

Be aware of the flow of layouts in `flutter`

<center><em>Flutter Layout Hierarchy</em></center>

![https://flutter.dev/assets/ui/layout/sample-flutter-layout-46c76f6ab08f94fa4204469dbcf6548a968052af102ae5a1ae3c78bc24e0d915.png](https://flutter.dev/assets/ui/layout/sample-flutter-layout-46c76f6ab08f94fa4204469dbcf6548a968052af102ae5a1ae3c78bc24e0d915.png)

## MaterialApp class 

Uses Material Design

Wrapper for material design widgets

`Home` shows in UI

`Scaffold` widget typically used

## Scaffold Widget is a high level widget

Container for widgets

## Clear Out App

Clear out all content from `main.dart`.

## Hello World

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: Text('Hello World', style: TextStyle(
        fontSize: 30,
        color: Colors.green[200]
      ))
    );
  }
}
```

## Create an `AppBar` with `Scaffold` class

Clear out the Hello World.

Add Scaffold instead

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  // override build
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WordPair Generator')
        ),
      )
    );
  }
}
```

## Change color of AppBar

```java
theme: ThemeData(primaryColor: Colors.purple[100]),
```

## Add Plain Text Child Widget

```java
body: Center(
  child: Text('Here is a child text item')
)
```

## Add English Words

### add `english_words` library from `pub.dev`

Add this to `pubspec.yaml` file

```json
english_words: ^3.1.5
```

```java
import 'package:english_words/english_words.dart';
```


### Generate Random Word Pairs

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
          title: Text('WordPair Generator')
        ),
        body: Center(
          child: Text(wordPair.asPascalCase)
        )
      )
    );
  }
}
```

## Refactor To Put Code In Class

```java
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[100]),
      home: RandomWords()
    );
  }
}
class RandomWords extends StatefulWidget {
  @override 
  RandomWordsState createState() => RandomWordsState();
}
class RandomWordsState extends State<RandomWords> {
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator')
      ),
      body: Center(
        child: Text(wordPair.asPascalCase)
      )
    );
  }
}
```

## Add ListView

```java
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[100]),
      home: RandomWords()
    );
  }
}
class RandomWords extends StatefulWidget {
  @override 
  RandomWordsState createState() => RandomWordsState();
}
class RandomWordsState extends State<RandomWords> {
  Widget _buildList(){
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator')
      ),
      body: _buildList()
    );
  }
}
```

