# API02

## Contents

- [API02](#api02)
  - [Contents](#contents)

## Introduction

This is my early attempts at building a flutter api project.  At this stage I am not really doing my own coding but just trying out a few tutorials to see how things work. 

This one is pulling from this tutorial

https://www.youtube.com/watch?v=GeeqfsgBx7U

## Start Point (blank app)

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
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
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
        title: Text('Flutter API'),
      ),
      body: Container(),
    );
  }
}
```

### lib/views/note_list.dart with `stles` as `stateless` prompt

This will have the list of notes

```java
import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => { 

        },
        child: Icon(Icons.add),
      ),
      body: Container(),
    );
  }
}
```

Now make the home page to use this page in `main.dart`









