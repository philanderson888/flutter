import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      print('you have clicked the counter $_counter times');
    });
  }

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
                          child: 
                            Text(
                              'clickable card - $_counter clicks',
                              style: TextStyle(color: Color(0xffede49f)),
                            ),
                            color: Color(0xffb25adb),  
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
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
