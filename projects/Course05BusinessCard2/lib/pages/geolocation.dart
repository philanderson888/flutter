import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';
import '../models/geolocation_service.dart';

const bodyFlexMarginLeftRight = 1;
const bodyFlexWidth = 20;
const bodyFlexMarginTopBottom = 1;
const bodyFlexHeight = 20;
var positionAsString = 'Geolocation - formal version';

class Geolocation extends StatefulWidget {
  const Geolocation({Key? key}) : super(key: key);
  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {
  static var geolocationPosition = GeolocationService();

  @override
  Widget build(BuildContext context) {
    getPosition() async {
      print('getPosition()');
      var position = await geolocationPosition.getPosition();
      print('the current position is $position');
      setState(() {
        positionAsString = position.toString();
      });
    }

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
                  child: GestureDetector(
                    onTap: getPosition,
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: Center(
                        child: Text(positionAsString,
                            style: kTextStyleSize60ColorBEE4CB),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: bodyFlexHeight,
                  child: GestureDetector(
                    onTap: getPosition,
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: Center(
                        child: Text(positionAsString,
                            style: kTextStyleSize60ColorBEE4CB),
                      ),
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
                color: kPurpleAccent,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

/*



 */
