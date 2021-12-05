# rows

## contents

- [rows](#rows)
  - [contents](#contents)


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
              ElevatedButton(
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

for a very simple way to lay out rows and columns which automatically will scroll beyond the bottom of the page if the content is too long vertically, use [list view](#list-view)

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
