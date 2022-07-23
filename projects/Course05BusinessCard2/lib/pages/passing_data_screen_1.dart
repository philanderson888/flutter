import 'package:flutter/material.dart';
import '../constants.dart';

class StatefulWidgetPassDataIn01 extends StatefulWidget {
  const StatefulWidgetPassDataIn01({Key? key}) : super(key: key);

  @override
  State<StatefulWidgetPassDataIn01> createState() =>
      _StatefulWidgetPassDataIn01();
}

class _StatefulWidgetPassDataIn01 extends State<StatefulWidgetPassDataIn01> {
  doNothing() {
    print('doing nothing');
  }

  goToScreen2() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PassingDataScreen02(
              passDataInHere: 'here is some data passed into a stateful widget',
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(color: kColorLightPink01),
            ),
            Expanded(
              flex: 20,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Container(color: kColorLightPink01),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: goToScreen2,
                      child: Center(
                        child: Text(
                            'here is screen 1 - click to go to screen 2',
                            style: kBmiResultsTextStyle),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(color: kColorLightPink01),
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

class PassingDataScreen02 extends StatefulWidget {
  const PassingDataScreen02({Key? key, required this.passDataInHere})
      : super(key: key);

  final String passDataInHere;
  @override
  State<PassingDataScreen02> createState() => _PassingDataScreen02();
}

class _PassingDataScreen02 extends State<PassingDataScreen02> {
  late final displayOutputText;

  @override
  void initState() {
    super.initState();
    print(widget.passDataInHere);
    displayOutputText = widget.passDataInHere;
  }

  doNothing() {
    print('doing nothing');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(color: kColorLightPink01),
            ),
            Expanded(
              flex: 20,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(color: kColorLightPink01),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child:
                          Text('here is screen 2', style: kBmiResultsTextStyle),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: kColorLightPink01),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child:
                          Text(displayOutputText, style: kBmiResultsTextStyle),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: kColorLightPink01),
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
