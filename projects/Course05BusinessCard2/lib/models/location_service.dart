import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';

var apiKey = 'invalid_api_key';

class LocationService {
  Future<String> getApiKey() async {
    await dotenv.load(fileName: "../.env");
    apiKey = dotenv.env['WEATHER_SERVICE'] ?? 'invalid_api_key';
    print('weather service api key from .env file $apiKey');
    return apiKey;
  }
}
