import 'package:flutter/material.dart';
import '../models/geolocation_service.dart';
import '../models/weather_service.dart';
import 'dart:async';
import '../constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherDisplay04 extends StatefulWidget {
  @override
  _WeatherDisplay04State createState() => _WeatherDisplay04State();
}

class _WeatherDisplay04State extends State<WeatherDisplay04> {
  var positionAsString = '';
  var weather =
      'today we are just getting the weather for you to have a look at ...';
  var city = 'Enfield';
  var country = 'GB';
  var lat = 0.0;
  var lon = 0.0;
  String weatherToday = 'today the weather is ...';
  String geolocationDataForCity = 'geolocation data for entered city is';
  String weatherStringForCity = 'weather today for your chosen city is .... ';
  String latitudeAndLongitudeForCity = 'lat: long:';

  static var geolocationPosition = GeolocationService();
  static var weatherApi = WeatherService();
  var spinnerVisible = true;
  var textEditingController;

  @override
  initState() {
    super.initState();
    print('Weather04tate initState() - Child');
    print('showing loading state');
    setState(() {
      positionAsString = 'Getting loading data ';
      textEditingController = TextEditingController(text: city);
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
      setState(() {
        spinnerVisible = false;
      });
    });

    Future.delayed(Duration(seconds: 1), () async {
      var apiKey = await weatherApi.getApiKey();
      print('apikey $apiKey');
    });

    print(
        'initState() widget attached to state is $widget which is the parent object and which means we can now send data into our stateful widget using this method ...');
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
      var temperature = weather.temperature;
      var temperatureString = '';
      if (temperature != null) {
        temperatureString = temperature.toStringAsFixed(0);
      }
      var weatherString =
          'weather today is ... $description with temperature of $temperatureString Celsius';
      weatherToday = weatherString;
      print(weatherString);
    });
  }

  printCity(cityEntered) {
    print('name of city entered is $cityEntered');
    setState(() {
      city = cityEntered;
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    });
  }

  getGeolocationDataForCity() async {
    print('getting geolocation data for city $city in $country');
    var geoPosition = await weatherApi.getGeoPositionForCity(city, country);
    print(
        'geoPosition obtained from weather service for city $city in $country is $geoPosition');
    setState(() {
      geolocationDataForCity = geoPosition.toString();
      lat = geoPosition.lat ?? 0;
      lon = geoPosition.lon ?? 0;
      latitudeAndLongitudeForCity = 'latitude : $lat, longitude: $lon';
    });
  }

  getWeatherDataForCity() async {
    print('getting weather data for city $city in $country');
    var weatherForGeoPosition =
        await weatherApi.getWeatherForGeoPosition(lat, lon);
    print(
        'weather data obtained from weather service for city $city in $country is $weatherForGeoPosition');
    setState(() {
      var description = weatherForGeoPosition.description;
      var temperature = weatherForGeoPosition.temperature;
      var temperatureString = '';
      if (temperature != null) {
        temperatureString = temperature.toStringAsFixed(0);
      }
      weatherStringForCity =
          'weather today for $city in $country is ... $description with temperature of $temperatureString Celsius';
      print(weatherStringForCity);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build method called');

    var spinner = Visibility(
        visible: spinnerVisible,
        child: SpinKitRotatingCircle(color: Colors.white));

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
                      color: kColorDarkGrey01,
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
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: spinner,
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
                      color: kColorDarkGrey01,
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
            flex: 1,
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
                      getGeolocationDataForCity();
                    },
                    child: Container(
                      color: kColorDarkGrey01,
                      child: Center(
                        child: Text('get geolocation data for your city'),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
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
                      color: kColorDarkGrey01,
                      child: Center(
                        child: TextField(
                          controller: textEditingController,
                          onChanged: (cityEntered) {
                            printCity(cityEntered);
                          },
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Please enter city name ...',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
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
            child: Center(child: Text(geolocationDataForCity)),
          ),
          Expanded(
            flex: 3,
            child: Center(child: Text(latitudeAndLongitudeForCity)),
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
                      getWeatherDataForCity();
                    },
                    child: Container(
                      color: kColorDarkGrey01,
                      child: Center(
                        child: Text('get weather data for your city'),
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
            child: Center(child: Text(weatherStringForCity)),
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
