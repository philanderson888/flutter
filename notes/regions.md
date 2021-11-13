# regions

## contents

- [regions](#regions)
  - [contents](#contents)
  - [introduction](#introduction)
  - [example](#example)

## introduction

regions are a very useful addition to VSCode because they

- break down code into small, meaningful and manageable chunks
- allow us the developer to fully understand the purpose of the code block within, even if the name of the function does not fully describe that purpose
- help us break down large, complex blocks of code into much smaller and manageable blocks
- helps us learn what is in the code by actually writing our own version of what the code is going
- helps us to understand each block of code and what it is doing, as we name the corresponding region
- helps us to maximise and minimise large blocks of code quickly, and to target only the code we are working on


## example

here is a worked example which will be built upon later

```java
// #region import
import 'package:flutter/material.dart';
import 'dart:math' as math;

// #endregion
// #region main
void main() {
  runApp(const MyApp());
}

// #endregion
// #region App => MaterialApp => Home page
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Flutter Card List View Demo'),
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
// #region _HomeState builds stateful widget
class _HomeState extends State<Home> {
  // #region initialise variables
  int _counter = 0;
  // #endregion
  // #region incrementCounter()
  void _incrementCounter() {
    setState(() {
      _counter++;
      print('you have clicked the counter $_counter times');
    });
  }

  // #endregion
  // #region widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
          padding: const EdgeInsets.all(100),
          shrinkWrap: true,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 1'),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 2'),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 3'),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 4'),
                  Text('Item 1'),
                  Text('Item 2'),
                  Text('Item 3'),
                  Text('Item 4'),
                  Text('Item 5'),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Row 5'),
                  Card(child: Text('Card 1')),
                  Card(child: Text('Card 2')),
                  Card(child: Text('Card 3')),
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Text('Row 6 With Columns'),
              const Card(child: Text('Row 6 Card 1')),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Row 6 Column '),
                    const Card(
                        color: Colors.yellow,
                        child: Text('Row 6 Column 1 Card 1')),
                    const Card(
                        color: Colors.blue,
                        child: Text('Row 6 Column 1 Card 2')),
                    const Card(
                      child: Text(
                        'Row 6 Column 1 Card 3',
                        style: TextStyle(color: Colors.green),
                      ),
                      color: Colors.red,
                    ),
                    const Card(
                      child: Text(
                        'Row 6 Column 1 Card 4 with Hex colour',
                        style: TextStyle(color: Colors.green),
                      ),
                      color: Color(0xffede49f),
                    ),
                    const Card(
                        child: Text(
                          'Row 6 Column 1 Card 5 with RGB colour',
                          style: TextStyle(color: Colors.green),
                        ),
                        color: Color.fromRGBO(100, 100, 100, 1.0)),
                    Card(
                      child: GestureDetector(
                          child: Card(
                            child: Text(
                              'clickable card - $_counter clicks',
                              style: TextStyle(color: Color(0xffede49f)),
                            ),
                            color: const Color(0xffb25adb),
                          ),
                          onTap: () => {
                                print('you clicked $_counter times'),
                                _incrementCounter()
                              }),
                    ),
                  ]),
            ]),
            const Card(child: ListTile(title: Text('List Tile 1'))),
            const Card(child: ListTile(title: Text('List Tile 2'))),
            const Card(child: ListTile(title: Text('List Tile 3'))),
            const Card(child: ListTile(title: Text('List Tile 4'))),
            const Card(child: ListTile(title: Text('List Tile 5'))),
            const Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('One-line with flutter widgets'),
                trailing: FlutterLogo(),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.more_vert),
                title: Text('One line with icons'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('One-line dense ListTile'),
                dense: true,
              ),
            ),
            Container(
              child: GestureDetector(
                  child: Card(
                    child: Text(
                      'clickable card - $_counter clicks',
                      style: TextStyle(color: Color(0xff000000)),
                    ),
                    color: const Color(0xffbbbbbb),
                  ),
                  onTap: () => {
                        print('you clicked $_counter times'),
                        _incrementCounter()
                      }),
              margin: const EdgeInsets.all(10),
              color: const Color(0xffb25adb),
              width: 48.0,
              height: 48.0,
            ),
            Container(
              child: GestureDetector(
                onTap: () =>
                    {print('you clicked $_counter times'), _incrementCounter()},
                child: Text('This is a clickable container $_counter clicks',
                    style: Theme.of(context).textTheme.headline4),
              ),
              margin: const EdgeInsets.all(10),
              color: const Color(0xffb25adb),
              width: 48.0,
              height: 48.0,
            ),
            Container(
              child: GestureDetector(
                onTap: () =>
                    {print('you clicked $_counter times'), _incrementCounter()},
                child: Text('This is a clickable container $_counter clicks',
                    style: Theme.of(context).textTheme.headline4),
              ),
              color: Colors.blue[600],
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.blue[600],
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(1 * math.pi / 180),
              child: GestureDetector(
                  child: Text(
                      'This is a clickable container $_counter clicks',
                      style: Theme.of(context).textTheme.headline4),
                  onTap: () => {
                        print('you clicked $_counter times'),
                        _incrementCounter()
                      }),
            ),
            Card(
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                    minHeight: 100,
                  ),
                  child:
                      Image.network('https://picsum.photos/100/100?random=1'),
                ),
                title: const Text('One-line with flutter widgets'),
                trailing: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 100,
                      minHeight: 100,
                    ),
                    child: Image.network(
                        'https://picsum.photos/100/100?random=2')),
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  // #endregion
}
// #endregion
```