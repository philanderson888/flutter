# components

## contents 

- [components](#components)
  - [contents](#contents)
  - [introduction](#introduction)
  - [widget samples](#widget-samples)
  - [material ui design samples](#material-ui-design-samples)
  - [Containers](#containers)
    - [Body Is A Single Container](#body-is-a-single-container)
    - [body: Center( child:Container()  )  will fill the screen](#body-center-childcontainer----will-fill-the-screen)
    - [Container With Shadow](#container-with-shadow)
  - [Rows](#rows)
    - [Single Row With One Centred Item](#single-row-with-one-centred-item)
    - [Single Row With Multiple Children In The Row](#single-row-with-multiple-children-in-the-row)
    - [Single Row with Button Click](#single-row-with-button-click)
  - [Row And Column Layout](#row-and-column-layout)
  - [Text](#text)
    - [Center Justify Text](#center-justify-text)
    - [Text Styling](#text-styling)
    - [Text Styling With Themes For The Whole App](#text-styling-with-themes-for-the-whole-app)
    - [Text Styling With Theme](#text-styling-with-theme)
    - [Text Styling using `Flutter Color` VSCode plugin](#text-styling-using-flutter-color-vscode-plugin)
    - [finding components by text](#finding-components-by-text)
  - [style](#style)
    - [color](#color)
  - [Margins](#margins)
    - [Margin All Round](#margin-all-round)
    - [Margin Vertical](#margin-vertical)
    - [Margin Right](#margin-right)
  - [Padding](#padding)
  - [Buttons](#buttons)
    - [Generic Button](#generic-button)
    - [Raised Button](#raised-button)
    - [Rounded Button](#rounded-button)
    - [Button With Shadow (have to add to a container and apply the shadow to the container so see Container With Shadow section)](#button-with-shadow-have-to-add-to-a-container-and-apply-the-shadow-to-the-container-so-see-container-with-shadow-section)
    - [Button With Icon](#button-with-icon)
    - [Button With Icon 2](#button-with-icon-2)
    - [ButtonClick01](#buttonclick01)
    - [Button Click 2](#button-click-2)
  - [images](#images)
    - [image example](#image-example)
    - [images with margin](#images-with-margin)
  - [list view](#list-view)
    - [simple list view with 3 rows](#simple-list-view-with-3-rows)

## introduction

next we have a look at some of the different types of components which can be built in a flutter app

## widget samples

to see example of all of the widget components available, see https://flutter.dev/docs/development/ui/widgets

## material ui design samples

to see examples of material ui design components please see https://material.io/develop/flutter

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
  child: ElevatedButton(
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
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
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
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
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
### finding components by text

When unit testing it is important to be able to find and identify items on the screen.  we can do this most simply by text

see [unit testing - finding a clickable widget by text](#finding-a-clickable-widget-by-text) in order to be able to undertand this.
## style

### color

```java
color: Colors.red,
// from ARGB (Alpha Red Green Blue)
color: Color(0xffaabbcc),
// from RGBO (Red Green Blue Opacity)
color: Color.fromRGBO(100,100,100,1.0)
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

## images

to create an image from the web we can use 

```java
child: new CircleAvatar(
  backgroundImage: new NetworkImage('https://i.ya-webdesign.com/images/avatar-png-1.png'),
  backgroundColor: Colors.lightGreen,
  radius: 24.0,
),
```

and to run the app we use

```java
flutter run -d Chrome --web-renderer html
```

### image example

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
              Image.network(
                'https://picsum.photos/200/300?random=1',
                height: 100, 
                width: 100, 
                fit: BoxFit.fill
              ),
              const Image(
                image: NetworkImage('https://picsum.photos/200/300?random=1'),
                width:100,
                height:100,
                fit: BoxFit.fill
              ),
              new CircleAvatar(
                backgroundImage: new NetworkImage('https://i.ya-webdesign.com/images/avatar-png-1.png'),
                backgroundColor: Colors.lightGreen,
                radius: 24.0,
              ),

          ]
        ),
      )
    );
  }
}
```

### images with margin

we can use [containers](#containers) to add a margin around all of our images with both `padding` and `margin`

to set our edge values we can do the same all round

```java
padding: const EdgeInsets.all(10),
```

or unique values per edge

```java
padding: const EdgeInsets.fromLTRB(10,10,10,10),
```

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
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  height: 100, 
                  width: 100, 
                  fit: BoxFit.fill
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  height: 100, 
                  width: 100, 
                  fit: BoxFit.fill
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5,5,5,5),
                margin: const EdgeInsets.fromLTRB(5,5,5,5,),
                child: const Image(
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  width:100,
                  height:100,
                  fit: BoxFit.fill
                ),
              ), 
              new CircleAvatar(
                backgroundImage: new NetworkImage('https://i.ya-webdesign.com/images/avatar-png-1.png'),
                backgroundColor: Colors.lightGreen,
                radius: 24.0,
              ),
          ]
        ),
      )
    );
  }
}
```

## list view

### simple list view with 3 rows

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
      body: ListView(
        padding: const EdgeInsets.all(100),
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                const Text('Row 1'),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    height: 100, 
                    width: 100, 
                    fit: BoxFit.fill
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    height: 100, 
                    width: 100, 
                    fit: BoxFit.fill
                  ),
                ),
            ]
          ), 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Text('Row 2'),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    height: 100, 
                    width: 100, 
                    fit: BoxFit.fill
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    height: 100, 
                    width: 100, 
                    fit: BoxFit.fill
                  ),
                ),
            ]
          ), 

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Row 3'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Column 1'),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                ]
              ), 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Column 2'),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                ]
              ), 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Column 3'),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100, 
                      width: 100, 
                      fit: BoxFit.fill
                    ),
                  ),
                ]
              ), 
            ]
          ), 
        ]
      ),
    );
  }
}
```