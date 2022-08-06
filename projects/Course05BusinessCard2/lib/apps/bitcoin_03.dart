import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Bitcoin03 extends StatefulWidget {
  const Bitcoin03({Key? key}) : super(key: key);

  @override
  State<Bitcoin03> createState() => _Bitcoin03State();
}

class _Bitcoin03State extends State<Bitcoin03> {
  var currencyAndroid = kCurrenciesList[0];
  var index = 0;
  var dropDownValue = kCurrenciesList[0];

  onDropDownSelectedAndroid(String newValue) {
    print('currency $newValue selected');
    setState(() {
      currencyAndroid = newValue;
      if (defaultTargetPlatform != TargetPlatform.iOS) {
        dropDownValue = currencyAndroid;
      }
    });
  }

  onDropDownSelectediOS(int selectedIndex) {
    print('currency ${kCurrenciesList[selectedIndex]} selected');
    setState(() {
      index = selectedIndex;
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        dropDownValue = kCurrenciesList[index];
      }
    });
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          onDropDownSelectediOS(selectedIndex);
        },
        children: kCurrenciesDropDownList);
  }

  DropdownButton<String> androidPicker() {
    return DropdownButton<String>(
      value: currencyAndroid,
      items: kCurrenciesDropDownList,
      onChanged: (String? newValue) {
        var value = newValue ?? '';
        onDropDownSelectedAndroid(value);
      },
    );
  }

  picker() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return iOSPicker();
    } else {
      return androidPicker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSkyBlue,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  color: kLightSkyBlue,
                  child: Center(child: Text('😎    Coin Ticker'))),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(color: kSuperLightSkyBlue),
                  ),
                  Expanded(
                    flex: 20,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(color: kSuperLightSkyBlue),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: kSuperLightSkyBlue,
                            child: Container(
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                color: kLightSkyBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text('BitCoin Price'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 40,
                          child: Container(
                            color: kSuperLightSkyBlue,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text('iOS'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Center(
                                          child: iOSPicker(),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                              'iOS picker chooses value ${kCurrenciesList[index]}'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text('Android'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: picker(),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                              '.. android holds $dropDownValue'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
              child: Container(color: kLightSkyBlue),
            ),
          ],
        ),
      ),
    );
  }
}
