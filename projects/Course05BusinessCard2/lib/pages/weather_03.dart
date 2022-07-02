import 'package:flutter/material.dart';
import '../models/geolocation_service.dart';

class Weather03 extends StatefulWidget {
  const Weather03({Key? key}) : super(key: key);

  @override
  State<Weather03> createState() => _Weather03State();
}

class _Weather03State extends State<Weather03> {
  initState() {
    print('Weather03State initState() - Parent');
  }

  doNothing() {
    print('doing nothing');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(color: Colors.black12),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.black26),
                  ),
                  Expanded(
                    flex: 10,
                    child: LoadingScreen(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.black26),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(color: Colors.black12),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var positionAsString = '';
  static var geolocationPosition = GeolocationService();

  @override
  initState() {
    super.initState();
    print('Weather03State initState() - Child');
    print('showing loading state');
    setState(() {
      positionAsString = 'Getting loading data ';
    });
    int loadingTime = 5;
    for (int i = 0; i <= loadingTime; i++) {
      int counter = i + 1;
      Future.delayed(Duration(seconds: counter), () {
        setState(() {
          positionAsString += '...';
        });
      });
    }

    Future.delayed(Duration(seconds: loadingTime), () {
      getPosition();
    });
  }

  @override
  deactivate() {
    super.deactivate();
  }

  getPosition() async {
    print('getPosition()');
    var position;
    try {
      position = await geolocationPosition.getPosition();
    } catch (e) {
      print(e);
    }

    setState(() {
      print('the current position is $position');
      positionAsString = position.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build method called');
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          getPosition();
        },
        child: Center(child: Text(positionAsString)),
      ),
    );
  }
}
