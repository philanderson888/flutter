# getting started

## table of contents
- [getting started](#getting-started)
  - [table of contents](#table-of-contents)
  - [getting started with an online ide](#getting-started-with-an-online-ide)
  - [installation](#installation)
  - [building your first project](#building-your-first-project)
    - [yaml](#yaml)
    - [default scaffolding](#default-scaffolding)
    - [Default Clean Screen](#default-clean-screen)
    - [Default Layout For Two Basic Pages](#default-layout-for-two-basic-pages)

## getting started with an online ide

flutter can be tried out instantly online using flutter's own website at https://flutter.dev/

It can also be used at [Flutter Studio](https://flutterstudio.app)

## installation

to install flutter download the zip file from https://flutter.dev/docs/get-started/install 

Choose a location such as c:\users\username\ and unzip the zip file so the path to flutter becomes

c:\users\username\flutter 

add the `flutter\bin` path to your environment variables, for example in the example above the path would be `c:\users\username\flutter\bin` which would be added to your `path` system variable 

On Windows, to do this, complete the following steps
1. Hit the Windows key
2. Type `env`
3. Select `edit system environment variables`
4. Choose `environment variables`
5. In `system variables` find `path` and click `edit` 
6. Click `new` to add a new entry to the path variables
7. Paste `c:\users\username\flutter\bin`
8. Press OK several times to save and exit
   
*note - changes may not take place until after a windows restart*

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
