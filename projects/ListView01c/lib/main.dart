//#region imports
import 'package:flutter/material.dart';

//#endregion imports
//#region main
void main() {
  print('running main app');
  runApp(App());
}

//#endregion main
//#region app
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static const String _title = 'Hello World';
  @override
  //#region widget builder
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: _title),
    );
  }
  //#endregion
}

//#endregion app
//#region home widget
class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 200.0,vertical: 15.0),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber,
            child: const Center(child: Text('List View Container')),
          ),
          Container(
            height: 50,
            color: Colors.amber,
            child: const Center(child: Text('List View Container')),
          ),
          Container(
            height: 50,
            color: Colors.amber,
            child: const Center(child: Text('List View Container')),
          ),
          const Card(child: ListTile(title: Text('List View Tile 1'))),
          const Card(child: ListTile(title: Text('List View Tile 2'))),
          const Card(child: ListTile(title: Text('List View Tile 3'))),
          const Card(child: ListTile(
                title: const Center(child: Text('List View Tile 4'))
              )
            ),
          const Card(child: const Center(
              child: ListTile(title: Text('List View Tile 5'))
            ),
          ),
          const Center(
            child: ListTile(
              title: const Center(
                child: Text('List View Tile 6')
              )
            )
          ),
          const Card(child: ListTile(
              title: const Center(child: Text('List View Tile 7'))
            )
          ),
        ]
      ),
    );
  }
}
//#endregion widget