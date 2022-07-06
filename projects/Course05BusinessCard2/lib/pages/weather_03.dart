import 'package:flutter/material.dart';
import '../models/geolocation_service.dart';
import '../models/weather_service.dart';
import '../constants.dart';
import 'dart:async';

const headerText = 'The Weather Today Is';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(color: kColorLightGrey01),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: kColorLightGrey02,
                      child: Center(
                        child: Text(
                          headerText,
                          style: kTextStyleWhiteHeading01,
                        ),
                      ),
                    ),
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
              child: Container(color: kColorLightGrey01),
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
  var weather =
      'today we are just getting the weather for you to have a look at ...';
  String weatherToday = 'today the weather is ...';

  static var geolocationPosition = GeolocationService();
  static var weatherApi = WeatherService();

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

    Future.delayed(Duration(seconds: 1), () async {
      var apiKey = await weatherApi.getApiKey();
      print('apikey $apiKey');
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

  getWeather() async {
    print('getWeather()');
    var weather = await weatherApi.getWeather();
    setState(() {
      var description = weather.description;
      print('the current weather is $description}');
      weatherToday = 'the weather today is .... $description';
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build method called');
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      getPosition();
                    },
                    child: Container(
                      color: kColorGrey01,
                      child: Center(
                        child: Text('get position'),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(positionAsString),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      getWeather();
                    },
                    child: Container(
                      color: kColorGrey01,
                      child: Center(
                        child: Text('get weather'),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                getPosition();
              },
              child: Center(child: Text(weatherToday)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
