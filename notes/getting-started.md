# getting started

## table of contents
- [getting started](#getting-started)
  - [table of contents](#table-of-contents)
  - [getting started with an online ide](#getting-started-with-an-online-ide)
  - [building your first project](#building-your-first-project)
    - [yaml](#yaml)
    - [default scaffolding](#default-scaffolding)
    - [Default Clean Screen](#default-clean-screen)
    - [Default Layout For Two Basic Pages](#default-layout-for-two-basic-pages)

## getting started with an online ide

We can get started quickly with flutter at this online ide [Flutter Studio at https://flutterstudio.app](https://flutterstudio.app)

## building your first project

To get started with building your first project locally we will need a few files

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
