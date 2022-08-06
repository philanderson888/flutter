import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DropDown01 extends StatefulWidget {
  const DropDown01({Key? key}) : super(key: key);

  @override
  State<DropDown01> createState() => _DropDown01State();
}

class _DropDown01State extends State<DropDown01> {
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
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Drop Down Box'),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            const Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  'This is a dropdown box',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text('Android'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: androidPicker(),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child:
                          Text('Android picker chooses value $currencyAndroid'),
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
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text('iOS'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: iOSPicker(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
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
                    flex: 3,
                    child: Center(
                      child:
                          Text('iOS or Android, depending on running platform'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: picker(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                          '..operating system agnostic text holds $dropDownValue'),
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
    );
  }
}
