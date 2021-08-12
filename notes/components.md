# components

## contents 
- [components](#components)
  - [contents](#contents)

## introduction

next we have a look at some of the different types of components which can be built in a flutter app

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

