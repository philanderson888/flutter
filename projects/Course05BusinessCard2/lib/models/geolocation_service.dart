import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationService {
  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    print('is geolocation service enabled? $serviceEnabled');

    if (!serviceEnabled) {
      return Future.error('Location Services Are Disabled');
    }

    permission = await Geolocator.checkPermission();

    print('geolocation permission is $permission');

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions Are Denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location Permissions Are Permanently Denied, We Cannot Request Permissions');
    }

    var position = await Geolocator.getCurrentPosition();

    print('position is $position');

    if (!kIsWeb) {
      var lastKnownPosition = await Geolocator.getLastKnownPosition();
      print('last known position is $lastKnownPosition');
    }

    return position;
  }
}
