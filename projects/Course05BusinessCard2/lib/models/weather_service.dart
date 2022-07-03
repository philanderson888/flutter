import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  Future<String> getApiKey() async {
    await dotenv.load(fileName: ".env");
    var weatherServiceApiKey = dotenv.env['WEATHER_SERVICE'].toString();
    print('weather service api key $weatherServiceApiKey');
    return weatherServiceApiKey;
  }

  Future<String> getWeather() async {
    print('getting weather');
    var weather = 'await getWeather()';
    print('weather is $weather');
    return weather;
  }
}
