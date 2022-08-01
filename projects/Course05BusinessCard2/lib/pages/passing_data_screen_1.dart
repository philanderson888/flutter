import 'package:flutter/material.dart';
import '../constants.dart';

class StatefulWidgetPassDataIn01 extends StatefulWidget {
  const StatefulWidgetPassDataIn01({Key? key}) : super(key: key);

  @override
  State<StatefulWidgetPassDataIn01> createState() =>
      _StatefulWidgetPassDataIn01();
}

class _StatefulWidgetPassDataIn01 extends State<StatefulWidgetPassDataIn01> {
  final clickToGoToScreen2 = 'here is screen 1 - click to go to screen 2';
  var dataReturnedFromScreen2 =
      'data returned from screen 2 will be displayed here ... ';

  doNothing() {
    print('doing nothing');
  }

  goToScreen2() async {
    final output = await Navigator.of(context).push(
      MaterialPageRoute<String>(
        builder: (context) => const PassingDataScreen02(
          passDataInHere: 'here is some data passed into a stateful widget',
        ),
      ),
    );
    print('output returned from screen 2 back to screen 1 again is $output');
    setState(() {
      dataReturnedFromScreen2 = output ?? 'Error - no data has been returned';
    });
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
                        child: Text(clickToGoToScreen2,
                            style: kBmiResultsTextStyle),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(color: kColorLightPink01),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(dataReturnedFromScreen2,
                          style: kBmiResultsTextStyle),
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
  final clickToReturnToScreen1 =
      'Click here to pass data back from screen 2 to screen 1';
  final screen2DataPassedBackIntoScreen1 =
      'Data passed back from screen 2 on pop() back into screen 1';

  @override
  void initState() {
    super.initState();
    print(widget.passDataInHere);
    displayOutputText = widget.passDataInHere;
  }

  doNothing() {
    print('doing nothing');
  }

  passDataBackFromScreen2ToScreen1() async {
    print('passing data back from screen 2 back into screen 1');
    Navigator.pop(context, screen2DataPassedBackIntoScreen1);
    return screen2DataPassedBackIntoScreen1;
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
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: passDataBackFromScreen2ToScreen1,
                      child: Center(
                        child: Text(clickToReturnToScreen1,
                            style: kBmiResultsTextStyle),
                      ),
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
