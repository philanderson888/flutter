import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'weather_adjusted.dart';

var apiKey = 'invalid_api_key';

class WeatherServiceFromLocation {
  Future<String> getApiKey() async {
    await dotenv.load(fileName: "../.env");
    apiKey = dotenv.env['WEATHER_SERVICE'] ?? 'invalid_api_key';
    print('weather service api key from .env file $apiKey');
    return apiKey;
  }

  Future<WeatherAdjusted> getWeather() async {
    print('getting weather');
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=20&lon=20&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    print('response status ${response.statusCode}');
    if (response.statusCode == 200) {
      var weatherAsResponseBody = response.body;

      var weatherAsJson = json.decode(weatherAsResponseBody);
      print('weatherAsJson is $weatherAsJson');
      var weatherSubObject = weatherAsJson['weather'];
      print('weatherSubObject is $weatherSubObject');
      //return Weather.fromJson(weatherSubObject[0]);

      var id = weatherAsJson['weather'][0]['id'];
      var description = weatherAsJson['weather'][0]['description'];
      var temperatureCelsius = weatherAsJson['main']['temp'];

      var weather = WeatherAdjusted(
          id: id, temperature: temperatureCelsius, description: description);
      return weather;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
