# Projects

## Word Pair

This is a sequence of projects following [Traversy Media](https://www.youtube.com/channel/UC29ju8bIPH5as8OGnQzwJyA) building a flutter application using Dart.  The YouTube link is [https://www.youtube.com/watch?v=1gDhl4leEzA](https://www.youtube.com/watch?v=1gDhl4leEzA).

If you're following, have fun!

### [API01](API01)

This reads one single piece of API data

### [API02](API02)

Not complete

### [WordPair01](WordPair01)

### [WordPair02](WordPair02)

### [WordPair03](WordPair03)

### [RowsAndColumns01](RowsAndColumns01)

### [ListView01 - Installing and getting started with basic ListView](ListView01)

### [ListView02 - many code snippets on ListView, most not live but easily swappable into the live code](ListView02)

### [ListView03 - Add icons at the end of each row](ListView03)

### [ListView04 - Adding multiple columns in each row of a ListView, and make them clickable](ListView04)

### [ListView05 - Dynamically Add And Delete Rows In A ListView using press and long hold](ListView05)

### [ListView06 - Dynamically Add And Delete Rows In A ListView using buttons](ListView06)

## [MultiPage01](MultiPage01)

Building an app with multiple pages

### [MultiPage02 - Simple app with super basic two pages](MultiPage02)

## Starter Code 

### Starter Code For All Projects Without Comments

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

### Default Scaffolding Without Comments

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