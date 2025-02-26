import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

var kTextStyleSize60ColorBEE4CB = const TextStyle(
  color: const Color(0xFFBEE4CB),
  fontSize: 60.0,
  fontWeight: FontWeight.bold,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var getPositionAsString = 'Geolocation - formal version';
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    print('is geolocation service enabled? $serviceEnabled');

    if (!serviceEnabled) {
      return Future.error('Location Services Are Disabled');
    }

    permission = await Geolocator.checkPermission();

    print('geolocation permission is $permission');

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions Are Denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location Permissions Are Permanently Denied, We Cannot Request Permissions');
    }

    var position = await Geolocator.getCurrentPosition();

    print('position is $position');

    return position;
  }

  determinePosition() async {
    print('determine position has been called');
    var position = await getPosition();
    print('the current position is $position');
    setState(() {
      print('the current position is $position');
      getPositionAsString = position.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: determinePosition,
                child: Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: Center(
                    child: Text(getPositionAsString,
                        style: kTextStyleSize60ColorBEE4CB),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
