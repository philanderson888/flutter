# next-steps

## contents

- [next-steps](#next-steps)
  - [contents](#contents)
  - [introduction](#introduction)
  - [flutter samples](#flutter-samples)
    - [add a column with two entries on the page](#add-a-column-with-two-entries-on-the-page)
    - [default Layout For Two Basic Pages](#default-layout-for-two-basic-pages)
  - [adding multiple files](#adding-multiple-files)
  - [file naming](#file-naming)


## introduction

after our [getting started](getting-started.md) session we can now begin to build slightly more complex apps ...

## flutter samples

if you want to investigate flutter sample code you can do so by running the command below and then inspecting the output file

```java
flutter create --list-samples=flutter-samples.json
```


### add a column with two entries on the page

```java
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: Home(),
    );
  }
}


class Home extends StatelessWidget {
  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home screen')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text('page body'),
              Text('second item'),
          ]
        ),
      )
    );
  }
}
```


### default Layout For Two Basic Pages

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

## adding multiple files

we can add multiple files to our project - just we have to add them as library imports to any files which use them.

```java
import '../folder/file.dart';
```

## file naming

prefer `lower_case_with_underscore.dart` file names