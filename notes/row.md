# rows

## contents

- [rows](#rows)
  - [contents](#contents)
  - [Single Row With One Centred Item](#single-row-with-one-centred-item)
  - [Single Row With Centred Column](#single-row-with-centred-column)
  - [Single Row With Multiple Children In The Row](#single-row-with-multiple-children-in-the-row)
    - [Single Row with Button Click](#single-row-with-button-click)
  - [Row And Column Layout](#row-and-column-layout)


## Single Row With One Centred Item

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

## Single Row With Centred Column

this has a column of items, but centered neatly on the screen by virtue of the `row` component, in which the column is centred horizontally

```java
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('this is an app'),
          backgroundColor: Colors.lightBlueAccent[200],
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: const <Widget>[
                Text('body11'),
                Text('body22'),
                Text('body33'),
                Image(
                  image: NetworkImage(
                      'https://www.w3schools.com/w3css/img_lights.jpg'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
                Image(
                  image: AssetImage('images/diamond.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
```
## Single Row With Multiple Children In The Row

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


