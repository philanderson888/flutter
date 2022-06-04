# buttons and gestures

## contents

- [buttons and gestures](#buttons-and-gestures)
  - [contents](#contents)
  - [introduction](#introduction)
    - [Generic Button](#generic-button)
    - [Raised Button](#raised-button)
    - [Rounded Button](#rounded-button)
    - [Button With Shadow (have to add to a container and apply the shadow to the container so see Container With Shadow section)](#button-with-shadow-have-to-add-to-a-container-and-apply-the-shadow-to-the-container-so-see-container-with-shadow-section)
    - [Button With Icon](#button-with-icon)
    - [Button With Icon 2](#button-with-icon-2)
    - [ButtonClick01](#buttonclick01)
    - [Button Click 2](#button-click-2)



## introduction

for a generic button just use a `gesture detector` which does not change the styling of the component etc.

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
        child: ElevatedButton(
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
body: ElevatedButton(
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
ElevatedButton(
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
  child: ElevatedButton.icon(
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
  child: ElevatedButton(
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
        child: new ElevatedButton(
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
