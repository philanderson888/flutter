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
      home: const Home(title: 'Flutter Demo Home Page'),
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                const Text('Row 1'),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                const Text('Row 2'),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                const Text('Row 3'),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Column 1'),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill),
                      ),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Column 2'),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill),
                      ),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Column 3'),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill),
                      ),
                    ]),
              ]),
            ],
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
