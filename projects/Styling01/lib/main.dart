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
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            child: const Center(child: Text('List View Container')),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            color: Colors.amber,
            child: const Center(child: Text('List View Container')),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            color: Colors.amber,
            child: const Center(child: Text('List View Container')),
          ),
          const Card(
            child: ListTile(title: Text('List View - Card + ListTile 1')),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            color: const Color(0xFF9adaed),
          ),
          const Card(
            child: ListTile(title: Text('List View - Card + ListTile 2')),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            color: const Color(0xFF9adaed),
          ),
          const Card(
            child: ListTile(title: Text('List View - Card + ListTile 3')),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            color: const Color(0xFF9adaed),
          ),
          const Card(
            child: ListTile(
              title: const Center(
                child: Text('List View - Card + ListTile 4')
            )),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            color: const Color(0xFF9adaed),
          ),
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
          const Card(
            child: ListTile(
              title: const Center(
                child: Text('List View - Card + ListTile 6'))
            ),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            color: const Color(0xFF9adaed),
          ),
          Text(
            'Paint() fill',
            style: TextStyle(
              fontSize: 100,
              foreground: Paint()
              ..style = PaintingStyle.fill
              ..color = Colors.blue[700]!,
            ),
          ),
          Stack(
            children: <Widget>[
              Text(
                'Paint() stroke outline - not working as expected',
                style: TextStyle(
                  fontSize: 50,
                  foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = Colors.black,
                ),
              ),
              Text(
                'Paint() stroke outline - not working as expected',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Text(
                'hello artistic text',
                style: TextStyle(
                  fontSize: 100,
                  foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 25
                  ..color = Colors.blue[700]!,
                  background: Paint()
                  ..style = PaintingStyle.fill
                  ..color = Colors.red[100]!,
                ),
              ),
              Text(
                'hello artistic text',
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}
//#endregion widget