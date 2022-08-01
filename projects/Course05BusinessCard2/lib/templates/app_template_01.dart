import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';

class AppTemplate01 extends StatefulWidget {
  const AppTemplate01({Key? key}) : super(key: key);

  @override
  State<AppTemplate01> createState() => _AppTemplate01State();
}

class _AppTemplate01State extends State<AppTemplate01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSkyBlue,
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(color: kLightSkyBlue),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(color: kVeryLightSkyBlue),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(color: kSuperLightSkyBlue),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                              child: Container(child: Text('a bitcoin app'))),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(color: kSuperLightSkyBlue),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: kVeryLightSkyBlue),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(color: kLightSkyBlue),
            ),
          ],
        ),
      ),
    );
  }
}
