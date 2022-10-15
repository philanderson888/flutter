import 'package:flutter/material.dart';
import '../models/geolocation_service.dart';
import '../constants.dart';

class LoadingAnimation01 extends StatefulWidget {
  const LoadingAnimation01({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation01> createState() => _LoadingAnimation01State();
}

class _LoadingAnimation01State extends State<LoadingAnimation01> {
  @override
  initState() {
    super.initState();
    print('Weather01State initState()');
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
              child: Container(color: kColorLightPink01),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(color: kColorLightGrey02),
                  ),
                  Expanded(
                    flex: 10,
                    child: LoadingScreen(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: kColorLightGrey02),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(color: kColorLightPink01),
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
  var positionAsString = 'Getting loading data ';
  static var geolocationPosition = GeolocationService();

  @override
  initState() {
    super.initState();
    print('Weather01State initState()');
    print('showing loading state');

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

  getPosition() async {
    print('getPosition()');
    var position = await geolocationPosition.getPosition();
    setState(() {
      print('the current position is $position');
      positionAsString = position.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
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
