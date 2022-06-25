import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

const bodyFlexMarginLeftRight = 1;
const bodyFlexWidth = 20;
const bodyFlexMarginTopBottom = 1;
const bodyFlexHeight = 20;

class Geolocation extends StatefulWidget {
  const Geolocation({Key? key}) : super(key: key);
  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {
  Future<Position> _determinePosition() async {
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
          'Location Permissions Are Permanently Denied, We Canno Request Permissions');
    }

    var position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    var position = _determinePosition();

    print('the current position is $position');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocation'),
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.amberAccent,
          child: Row(children: <Widget>[
            Expanded(
              flex: bodyFlexMarginLeftRight,
              child: Container(
                color: Colors.pink,
              ),
            ),
            Expanded(
              flex: bodyFlexWidth,
              child: Column(children: <Widget>[
                Expanded(
                  flex: bodyFlexMarginTopBottom,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: bodyFlexHeight,
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: Text('hi'),
                    ),
                  ),
                ),
                Expanded(
                  flex: bodyFlexMarginTopBottom,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: bodyFlexMarginLeftRight,
              child: Container(
                color: Colors.purpleAccent,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
