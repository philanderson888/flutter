import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';

class ToggleButton01 extends StatefulWidget {
  const ToggleButton01({Key? key}) : super(key: key);

  @override
  State<ToggleButton01> createState() => _ToggleButton01State();
}

class _ToggleButton01State extends State<ToggleButton01> {
  final genders = ['Male', 'Female'];
  final ages = ['0-12', '13-17', '18-27', 'Over 25'];
  final ethnicities = ['White', 'Afro/Caribbean', 'Asian', 'East European'];

  final List<bool> _selectedGender = <bool>[true, false];
  final List<bool> _selectedAge = <bool>[false, false, false, true];
  final List<bool> _selectedEthnicity = <bool>[true, false, false, false];

  final List<Widget> genderWidgets = [];
  final List<Widget> ageWidgets = [];
  final List<Widget> ethnicityWidgets = [];

  late var age = 'Over 25';
  late var gender = 'Male';
  late var ethnicity = 'White';

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < genders.length; i++) {
      var widget = Text(genders[i]);
      genderWidgets.add(widget);
    }
    for (int i = 0; i < ages.length; i++) {
      var widget = Text(ages[i]);
      ageWidgets.add(widget);
    }
    for (int i = 0; i < ethnicities.length; i++) {
      var widget = Text(ethnicities[i]);
      ethnicityWidgets.add(widget);
    }
  }

  formSubmit() {
    print('form submitted with values - $ethnicity $gender age $age');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey001,
                child: Center(
                  child: Text('Toggle Button', style: kTextStyle40Bold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey002,
                child: Center(
                  child: Center(child: Text('')),
                ),
              ),
            ),
            //
            // gender
            //
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey001,
                child: Center(
                  child: Center(
                      child: ToggleButtons(
                    children: genderWidgets,
                    isSelected: _selectedGender,
                    onPressed: (int index) {
                      gender = genders[index].toString();
                      print('selected gender is $gender');
                      setState(() {
                        for (int i = 0; i < _selectedGender.length; i++) {
                          _selectedGender[i] = i == index;
                        }
                      });
                    },
                  )),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey002,
                child: Center(child: Text('')),
              ),
            ),
            //
            // age
            //
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey001,
                child: Center(
                  child: Center(
                      child: ToggleButtons(
                    children: ageWidgets,
                    isSelected: _selectedAge,
                    onPressed: (int index) {
                      age = ages[index].toString();
                      print('selected age is $age');
                      setState(() {
                        for (int i = 0; i < _selectedAge.length; i++) {
                          _selectedAge[i] = i == index;
                        }
                      });
                    },
                  )),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey002,
                child: Center(child: Text('')),
              ),
            ),
            //
            // ethnicity
            //
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey001,
                child: Center(
                  child: Center(
                      child: ToggleButtons(
                    children: ethnicityWidgets,
                    isSelected: _selectedEthnicity,
                    onPressed: (int index) {
                      ethnicity = ethnicities[index].toString();
                      print('selected ethnicity is $ethnicity');
                      setState(() {
                        for (int i = 0; i < _selectedEthnicity.length; i++) {
                          _selectedEthnicity[i] = i == index;
                        }
                      });
                    },
                  )),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey002,
                child: Center(child: Text('')),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey001,
                child: GestureDetector(
                  onTap: () {
                    formSubmit();
                  },
                  child: Center(
                    child: Center(child: Text('Submit')),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey002,
                child: Center(child: Text('')),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey001,
                child: Center(
                  child: Center(child: Text('')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
