import 'package:flutter/material.dart';
import '../constants.dart';
import 'weather_display_04.dart';

class Weather04 extends StatefulWidget {
  const Weather04({Key? key}) : super(key: key);

  @override
  State<Weather04> createState() => _Weather04State();
}

class _Weather04State extends State<Weather04> {
  initState() {
    print('Weather04State initState() - Parent');
  }

  doNothing() {
    print('doing nothing');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(color: kColorLightPink01),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: kColorLightGrey02,
                      child: Center(
                        child: Text(
                          'The Weather Today Is',
                          style: kPacifico55White,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: WeatherDisplay04(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: kColorLightGrey02),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(color: kColorLightPink01),
            ),
          ],
        ),
      ),
    );
  }
}
