import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

var apiKey = 'invalid_api_key';

class WeatherService {
  Future<String> getApiKey() async {
    await dotenv.load(fileName: "../.env");
    apiKey = dotenv.env['WEATHER_SERVICE'] ?? 'invalid_api_key';
    print('weather service api key from .env file $apiKey');
    return apiKey;
  }

  Future<Weather> getWeather() async {
    print('getting weather');
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=20&lon=20&appid=$apiKey';
    final response = await http.get(Uri.parse(url));
    print('response status ${response.statusCode}');
    if (response.statusCode == 200) {
      var weatherAsResponseBody = response.body;

      var weatherAsJson = json.decode(weatherAsResponseBody);
      print('weatherAsJson is $weatherAsJson');
      var weatherSubObject = weatherAsJson['weather'];
      print('weatherSubObject is $weatherSubObject');
      return Weather.fromJson(weatherSubObject[0]);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  Weather.createPostObject(id, main, description, icon)
      : id = id,
        main = main,
        description = description,
        icon = icon;

  Map<String, dynamic> toJson() =>
      {'id': id, 'main': main, 'description': description, 'icon': icon};

  Weather.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        main = json['main'],
        description = json['description'],
        icon = json['icon'];
}
