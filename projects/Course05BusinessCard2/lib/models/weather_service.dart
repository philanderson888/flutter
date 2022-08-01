import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_teaching_app/models/geo_position.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'weather_adjusted.dart';

var apiKey = 'invalid_api_key';

class WeatherService {
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

  Future<WeatherAdjusted> getWeather2() async {
    print('getting location');
    var city = 'Enfield';
    var state = '';
    var country = '';
    var limit = 10;

    var url =
        'https://api.openweathermap.org/geo/1.0/direct?q={city}&limit={limit}&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    print('response status ${response.statusCode}');
    if (response.statusCode == 200) {
      var weatherAsResponseBody = response.body;

      var weatherAsJson = json.decode(weatherAsResponseBody);
      print('location data for $city is $weatherAsJson');
      //var weatherSubObject = weatherAsJson['weather'];
      //print('weatherSubObject is $weatherSubObject');
      //return Weather.fromJson(weatherSubObject[0]);

      //var id = weatherAsJson['weather'][0]['id'];
      //var description = weatherAsJson['weather'][0]['description'];
      //var temperatureCelsius = weatherAsJson['main']['temp'];

      //var weather = WeatherAdjusted(
      //id: id, temperature: temperatureCelsius, description: description);

      var weather = WeatherAdjusted(
          id: 1234, temperature: 10, description: 'a description');
      return weather;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<WeatherAdjusted> getWeatherForFixedPosition() async {
    print('getting location');
    var lat = 20;
    var lon = 20;
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
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
      var temperatureKelvin = weatherAsJson['main']['temp'];
      var temperatureCelsius = (temperatureKelvin - 273.15);

      var weather = WeatherAdjusted(
          id: id, temperature: temperatureCelsius, description: description);
      return weather;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<WeatherAdjusted> getWeatherForGeoPosition(
      double latitude, double longitude) async {
    print(
        'getting weather for geoPosition latitude $latitude longitude $longitude');
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
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

  Future<WeatherAdjusted> getWeatherForCity(String city, String country) async {
    print('getting location for city $city in $country');
    var limit = 1;
    var url =
        'https://api.openweathermap.org/geo/1.0/direct?q=$city,$country&limit=$limit&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    print('response status ${response.statusCode}');
    if (response.statusCode == 200) {
      var weatherAsResponseBody = response.body;
      var weatherAsJson = json.decode(weatherAsResponseBody);
      print('weather data for city $city in $country is $weatherAsJson');
      //var weatherSubObject = weatherAsJson['weather'];
      //print('weatherSubObject is $weatherSubObject');
      //return Weather.fromJson(weatherSubObject[0]);

      //var id = weatherAsJson['weather'][0]['id'];
      //var description = weatherAsJson['weather'][0]['description'];
      //var temperatureCelsius = weatherAsJson['main']['temp'];

      //var weather = WeatherAdjusted(
      //id: id, temperature: temperatureCelsius, description: description);

      var weather = WeatherAdjusted(
          id: 1234, temperature: 10, description: 'a description');
      return weather;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<GeoPosition> getGeoPositionForCity(String city, String country) async {
    print('getting position coordinates');
    var limit = 1;
    var url =
        'https://api.openweathermap.org/geo/1.0/direct?q=$city,$country&limit=$limit&appid=$apiKey';
    final response = await http.get(Uri.parse(url));
    print('response status ${response.statusCode}');
    if (response.statusCode == 200) {
      var positionAsResponseBody = response.body;
      var positionAsJson = json.decode(positionAsResponseBody);
      print('location data for $city is ${positionAsJson[0]}');
      var name = positionAsJson[0]['name'];
      var state = positionAsJson[0]['state'];
      var country = positionAsJson[0]['country'];
      var lat = positionAsJson[0]['lat'];
      var lon = positionAsJson[0]['lon'];

      var geoPosition = GeoPosition(
          name: name, state: state, country: country, lat: lat, lon: lon);
      return geoPosition;
    } else {
      throw Exception('Failed to load position from city $city in $country');
    }
  }
}
