# styling

## contents

- [styling](#styling)
  - [contents](#contents)
  - [introduction](#introduction)
    - [Center Justify Text](#center-justify-text)
    - [Text Styling](#text-styling)
    - [text styling in a container](#text-styling-in-a-container)
    - [Text Styling With Themes For The Whole App](#text-styling-with-themes-for-the-whole-app)
    - [Text Styling With Theme](#text-styling-with-theme)
    - [Text Styling using `Flutter Color` VSCode plugin](#text-styling-using-flutter-color-vscode-plugin)
    - [finding components by text](#finding-components-by-text)
  - [tooltip](#tooltip)
  - [styling](#styling-1)
    - [color](#color)
  - [Margins](#margins)
    - [Margin All Round](#margin-all-round)
    - [Margin Vertical](#margin-vertical)
    - [Margin Right](#margin-right)
  - [Padding](#padding)
  - [Styling](#styling-2)
    - [styling a container](#styling-a-container)
    - [styling a card](#styling-a-card)
    - [styling a ListTile](#styling-a-listtile)
  - [constraints](#constraints)




## introduction

this section involves basic styling of basic widgets including

- center
- style
- margin
- padding
- theme

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

## styling

to see a styling example, see [Styling01](../projects/Styling01)
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

## Styling

we can style using a number of different effects.  Here is an example of styling a `ToolTip` component 

- height
- textStyle
- fontSize
- padding
  - EdgeInsets.all()
- decoration
  - BoxDecoration
    - borderRadius
    - gradient
      - LinearGradient[amber,red]

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
