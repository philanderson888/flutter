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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
            Text('Row 1'),
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
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
