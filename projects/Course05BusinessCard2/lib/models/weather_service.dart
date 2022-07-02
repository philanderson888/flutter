import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  Future<String> getWeather() async {
    print('getting weather');
    var weather = 'await getWeather()';
    print('weather is $weather');
    return weather;
  }
}
