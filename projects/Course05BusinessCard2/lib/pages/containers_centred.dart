import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
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
