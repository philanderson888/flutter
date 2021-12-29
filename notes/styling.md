# styling

## contents

- [styling](#styling)
  - [contents](#contents)
  - [introduction](#introduction)
  - [finding components](#finding-components)
  - [justifying](#justifying)
    - [center justify](#center-justify)
  - [margin](#margin)
    - [margin all](#margin-all)
    - [margin vertical](#margin-vertical)
    - [margin horizontal](#margin-horizontal)
  - [padding](#padding)
  - [color](#color)
  - [height](#height)
  - [font](#font)
    - [styling a container](#styling-a-container)
    - [styling a card](#styling-a-card)
    - [styling a ListTile](#styling-a-listtile)
  - [styling](#styling-1)
    - [Text Styling](#text-styling)
    - [text styling in a container](#text-styling-in-a-container)
    - [Text Styling With Themes For The Whole App](#text-styling-with-themes-for-the-whole-app)
  - [decoration](#decoration)
  - [theme](#theme)
    - [textTheme](#texttheme)
    - [color foreground and background](#color-foreground-and-background)
  - [tooltip](#tooltip)
  - [constraints](#constraints)




## introduction

this section involves basic styling of basic widgets including

- center
- style
- margin
- padding
- theme


## finding components

When unit testing it is important to be able to find and identify items on the screen.  we can do this most simply by text

see [unit testing - finding a clickable widget by text](#finding-a-clickable-widget-by-text) in order to be able to undertand this.

## justifying

### center justify

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






## margin

### margin all 

```java
Container(
  margin: const EdgeInsets.all(20),
  child: Text('some text'),
),
```

### margin vertical

```java
margin: EdgeInsets.symmetric(vertical:10.0),
```

### margin horizontal

```java
Container(
  margin: const EdgeInsets.only(right:10.0),
  child: Text('some text'),
),
```


## padding

```java
padding: const EdgeInsets.all(30),
```

## color

```java
color: Colors.red,
// from ARGB (Alpha Red Green Blue)
color: Color(0xffaabbcc),
// from RGBO (Red Green Blue Opacity)
color: Color.fromRGBO(100,100,100,1.0)
```

## height

```java
height: 50,
```

## font 

```java
textStyle: const TextStyle(fontSize:24),
```



### styling a container

to see the next three styling examples in a worked example, see [Styling01](../projects/Styling01)

```java
Container(
  height: 50,
  color: Colors.amber,
  margin: const EdgeInsets.symmetric(vertical: 5.0),
  child: const Center(child: Text('List View Container')),
),
```

### styling a card

```java
const Card(
  child: ListTile(title: Text('List View - Card + ListTile 1')),
  margin: const EdgeInsets.symmetric(vertical: 5.0),
  color: const Color(0xFF9adaed),
),
```

### styling a ListTile

```java
Center(
  child: Container(
    decoration: BoxDecoration(color: const Color(0xFF9adaed)),
    margin: const EdgeInsets.symmetric(vertical: 5.0),
    child: ListTile(
      title: const Center(
        child: Text('List View - Card + ListTile 5'),
      ),
    ),
  )
),
```


## styling

to see a styling example, see [Styling01](../projects/Styling01)

### Text Styling

```java
Text("BUTTON 2",
  style: new TextStyle(fontSize:12.0,
  color: const Color(0xFF000000),
  fontWeight: FontWeight.w200,
  fontFamily: "Roboto"),
)
```

### text styling in a container

```java
Container(
  padding: EdgeInsets.fromLTRB(0,10,0,10),
  child: Text(
    'single api record',
    style: TextStyle(
      fontSize: 15, 
      fontWeight: FontWeight.bold, 
      fontStyle: FontStyle.italic, 
      decoration: TextDecoration.underline),
  ),                
),
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

## decoration

decoration can add effects to components such as

- borderRadius
- gradient
  - linear


different decorations exist such as

- BoxDecoration


```java
Tooltip(
  message: 'This is some help text to understand what to do ',
  child: const Text('This is some text without much explanation'),
  waitDuration: const Duration(seconds: 1),
  showDuration: const Duration(seconds: 4),
  height: 50,
  textStyle: const TextStyle(fontSize:24),
  padding: const EdgeInsets.all(8.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: const LinearGradient(colors: <Color>[Colors.amber, Colors.red]),
  ),
),
```

## theme

themes apply global styling across the app, so are very useful to provide a coherency of styling 

### textTheme

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

### color foreground and background 

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


## tooltip

tooltip is hover text which appears above a component to explain to the user a little more about the component or what action to take

```java
Tooltip(
  message: 'This is some help text to understand what to do ',
  child: const Text('This is some text without much explanation'),
  waitDuration: const Duration(seconds: 1),
  showDuration: const Duration(seconds: 4),
  height: 50,
  textStyle: const TextStyle(fontSize:24),
  padding: const EdgeInsets.all(8.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: const LinearGradient(colors: <Color>[Colors.amber, Colors.red]),
  ),
),
```


## constraints

we can apply constraints to set maximum or minimum sizes

see [APIGet04](../projects/APIGet04) for an example of setting minimum card width

```java
child: ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 300.0
  ),
  child: Card(
    child: Padding(
      padding: EdgeInsets.all(5.0),
      child: Text(output),
    ),
    color: cardColor,                                
  ),
),
```
