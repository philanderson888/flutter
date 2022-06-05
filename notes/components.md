# components

## contents 

- [components](#components)
  - [contents](#contents)
  - [introduction](#introduction)
  - [samples](#samples)
  - [Containers](#containers)
  - [Rows](#rows)
  - [Columns](#columns)
  - [Text](#text)
  - [strings](#strings)
  - [styling](#styling)
  - [buttons and gestures](#buttons-and-gestures)
  - [images](#images)
    - [image example](#image-example)
    - [images with margin](#images-with-margin)
  - [visibility](#visibility)
  - [list view](#list-view)
    - [simple list view with 3 rows](#simple-list-view-with-3-rows)
    - [listView with listTile](#listview-with-listtile)
  - [dropdown button](#dropdown-button)
  - [forms](#forms)
  - [snack bar](#snack-bar)
  - [slider](#slider)

## introduction

next we have a look at some of the different types of components which can be built in a flutter app

## samples

- demos https://gallery.flutter.dev/ 
- widgets https://flutter.dev/docs/development/ui/widgets
- material design examples https://material.io/develop/flutter
- javatpoint.com flutter tutorials https://www.javatpoint.com/flutter
- [all-in-one-app-demo](all-in-one-app-demo.md)

## Containers

[containers](containers.md)

## Rows

[rows](rows.md)

## Columns

[columns](columns.md)

## Text

```java
// left justified text
Text('some text')
```

## strings

[strings](syntax.md#strings)

## styling

[styling](styling.md)



## buttons and gestures

[buttons and gestures](buttons-and-gestures.md)


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

## visibility

we can easily show and hide components with the `Visibility` class

```java
// #region import
import 'package:flutter/material.dart';

// #endregion
// #region main
void main() {
  runApp(const App());
}

// #endregion
// #region App => MaterialApp => Home page
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static const String _title = 'Flutter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: _title),
    );
  }
}

// #endregion
// #region Home state => _HomeState
class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

// #endregion
// #region _HomeState extends state
class _HomeState extends State<Home> {
  // #region initialise variables
  int _counter = 0;
  bool _ok = false;
  bool _cancel = false;
  // #endregion
  // #region incrementCounter()
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _registerAlertOK() {
    setState(() {
      _ok = true;
      _cancel = false;
    });
    print('ok set to $_ok');
  }

  void _registerAlertCancel() {
    setState(() {
      _ok = false;
      _cancel = true;
    });
    print('_cancel set to $_cancel');
  }

  // #endregion
  // #region widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // #region app bar
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // #endregion
      // #region body
      body: Center(
        // #region column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.orange,
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('This is an alert'),
                  content: const Text('This is an alert description.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => {
                        print('You pressed "cancel"'),
                        _registerAlertCancel(),
                        Navigator.pop(context, 'Cancel')
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => {
                        _registerAlertOK(),
                        print('You pressed "OK"'),
                        Navigator.pop(context, 'OK')
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: const Text('Show Dialog'),
            ),
            Visibility(
              child: const Text(
                'You pressed OK button - well done',
              ),
              visible: _ok,
            ),
            Visibility(
              child: const Text(
                'You pressed the cancel button to cancel the dialog',
              ),
              visible: _cancel,
            ),
          ],
        ),
        // #endregion
      ),
      // #endregion
      // #region floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // #endregion
    );
  }
  // #endregion
}
// #endregion
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


### listView with listTile

This demo shows a list of tiles each of fixed height in relation to the screen height - see [List02](../projects/List02)

```java
/// This illustrates the use of flex layout to lay out an item on the screen
import 'package:flutter/material.dart';
void main() => runApp(const App());
class App extends StatelessWidget {
  const App({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'An App',
      home: Home()
    );
  }
}
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    log(output){
      int width = (MediaQuery.of(context).size.width).round();
      int height = (MediaQuery.of(context).size.height).round();
      print('$output printed with width $width height $height');
    }
    return Scaffold(
      appBar:AppBar(title: const Text('A List containing tappable ListItems')),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              itemExtent: ((MediaQuery.of(context).size.height).round())/7,
              children: <Widget>[                
                ListTile(  
                  leading: Icon(Icons.map),  
                  title: Text('Map'),  
                  onTap: () => log('map'),
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),  
                ListTile(  
                  leading: Icon(Icons.photo_album),  
                  title: Text('Album'),  
                  onTap: () => log('Album'),
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),  
                ListTile(  
                  leading: Icon(Icons.phone),  
                  title: Text('Phone'),  
                  subtitle: Text('subtitle'),
                  onTap: () => log('Phone'),
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),  
                ListTile(  
                  leading: Icon(Icons.contacts),  
                  title: Text('Contact'),  
                  subtitle: Text('A sufficiently long subtitle warrants three lines yes yes yes yes yes yes'),
                  onTap: () => log('Contact'),
                  tileColor: Color(0xFFb7dced),
                  dense: true,
                ),  
                SizedBox(
                  height: ((MediaQuery.of(context).size.height).round())/15,
                  child: ListTile( 
                    leading: Icon(Icons.contacts),  
                    title: Text('Contact'),  
                    subtitle: Text('A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes A sufficiently long subtitle warrants three lines yes yes yes yes yes yes'),
                    onTap: () => log('Contact'),
                    tileColor: Color(0xFFb7dced),
                    dense: true,
                  ),                 
                ),
                SizedBox(
                  height: ((MediaQuery.of(context).size.height).round())/15,
                  child: ListTile(  
                    leading: Icon(Icons.settings),  
                    title: Text('Setting'),  
                    onTap: () => log('Setting'), 
                    tileColor: Color(0xFFb7dced),
                    dense: true,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ]
      ),
    );
  }
}
```

## dropdown button

see [dropdownbutton01](../projects/DropdownButton01)

```java
String dropdownValue = 'One';
DropdownButton<String>(
  value: dropdownValue,
  onTap: () => print('about to make a dropdown box selection'),
  onChanged: (String? newValue) {
    print('you chose item $newValue (was $dropdownValue)');
    setState(() {
      dropdownValue = newValue!;
    });
  },
  items: <String>['One', 'Two', 'Three']
    .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value, child: Text(value));
  }).toList(),
),
```

## forms

[forms](forms.md)

## snack bar

a snack bar is an alert dialog box which appears at the bottom of the screen, and can have one or more action buttons for the user to click.  very similar to a dialog alert box, but just appearing at the bottom instead of overlaying the center of the main screen, which normal dialog boxes tend to do.  This can be useful to still give the user visibility of the main content.

see [SnackBar01](../projects/SnackBar01) for a worked example of a SnackBar

```java
ElevatedButton(
  onPressed: () {
    final snackBar = SnackBar(
        content: const Text('This is a snackbar'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              print('undo snack bar');
            }));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  },
  child: const Text('Show Snackbar'),
)
```

## slider

```java
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

```

