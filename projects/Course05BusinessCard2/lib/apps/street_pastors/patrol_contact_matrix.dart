import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatrolContactMatrix extends StatefulWidget {
  const PatrolContactMatrix({Key? key}) : super(key: key);

  @override
  State<PatrolContactMatrix> createState() => _PatrolContactMatrixState();
}

class _PatrolContactMatrixState extends State<PatrolContactMatrix> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var textEditingControllerEmail;
  var textEditingControllerPassword;
  var email = '123@abc.com';
  var password = 'verySecure123';
  var location = 'Enfield';
  var patrolLeader = 'Phil';
  var cadNumber = '123ABC';
  var bottleCounter = 0;
  var peopleHelpedCounter = 0;
  var peopleToSafetyCounter = 0;
  late var signedInUser;
  late TextEditingController textEditingControllerLocation;
  late TextEditingController dateController;
  late TextEditingController timeControllerStart;
  late TextEditingController timeControllerEnd;
  late TextEditingController textEditingControllerPatrolLeader;
  late TextEditingController textEditingControllerCadNumber;

  String valueChanged = '2000-09-20';
  String valueToValidate = '2000-09-20';
  String valueSaved = '2000-09-20';

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
  initState() {
    print('patrol details - page 01');
    super.initState();
    getSignedInUser();
    initializeDateFormatting();
    Intl.defaultLocale = 'pt_BR';
    dateController = TextEditingController(
        text: DateTime.now().subtract(Duration(days: 1)).toString());
    timeControllerStart = TextEditingController(text: getRoundedTimeNow());
    timeControllerEnd = TextEditingController(text: getRoundedTimeThen());
    textEditingControllerLocation = TextEditingController(text: location);
    textEditingControllerPatrolLeader =
        TextEditingController(text: patrolLeader);
    textEditingControllerCadNumber = TextEditingController(text: cadNumber);
    _getValue();

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

  getSignedInUser() async {
    try {
      signedInUser = await _auth.currentUser;
      print(
          'new patrol screen - user is signed in - email .. ${signedInUser.email} .. uid .. ${signedInUser.uid} .. ');
    } catch (e) {
      print(e);
    }
  }

  String getRoundedTimeNow() {
    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    int minutes = TimeOfDay.now().minute;
    var minutesRounded = 5 * ((minutes / 5).floor());
    String lsMinute = minutesRounded.toString().padLeft(2, '0');
    var outputTimeString = '$lsHour:$lsMinute';
    return outputTimeString;
  }

  String getRoundedTimeThen() {
    var hour24 = (TimeOfDay.now().hour + 5) % 24;
    String lsHour = hour24.toString().padLeft(2, '0');
    int minutes = TimeOfDay.now().minute;
    var minutesRounded = 5 * ((minutes / 5).floor());
    String lsMinute = minutesRounded.toString().padLeft(2, '0');
    var outputTimeString = '$lsHour:$lsMinute';
    return outputTimeString;
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        dateController.text = DateTime.now().toString();
      });
    });
  }

  onDateChanged(String value) {
    print('date has changed');
    setState(() {
      valueSaved = value;
    });
  }

  setLocation(String value) {
    print('Location has changed');
    setState(() {
      location = value;
    });
  }

  setPatrolLeader(String value) {
    setState(() {
      print('Patrol leader is $patrolLeader');
      patrolLeader = value;
    });
  }

  setCadNumber(String value) {
    setState(() {
      cadNumber = value;
      print('CAD Number $cadNumber');
    });
  }

  startPatrol() {
    print('patrol is being started');
    final loForm = _oFormKey.currentState;
    if (loForm?.validate() == true) {
      loForm?.save();
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PatrolContactMatrix()));
  }

  goToContactMatrix() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PatrolContactMatrix()));
  }

  incrementBottleCounter(int increment) {
    print('bottle counter clicked');
    setState(() {
      if (bottleCounter >= 0) {
        bottleCounter = bottleCounter + increment;
        print('bottle count now at $bottleCounter');
      }
    });
  }

  incrementPeopleHelpedCounter(int increment) {
    setState(() {
      if (peopleHelpedCounter >= 0) {
        peopleHelpedCounter = peopleHelpedCounter + increment;
        print('people helped $peopleHelpedCounter');
      }
    });
  }

  incrementPeopleToSafetyCounter(int increment) {
    setState(() {
      if (peopleToSafetyCounter >= 0) {
        peopleToSafetyCounter = peopleToSafetyCounter + increment;
        print('people helped $peopleToSafetyCounter');
      }
    });
  }

  getPatrols() async {
    print('getting patrol record from database ... waiting ...');
    final patrols = await _firestore.collection('patrols').get();
    final patrolsArray = patrols.docs;
    final count = patrolsArray.length.toString();
    print('there are $count patrols');
    patrolsArray.forEach((patrol) {
      var startDate = patrol.data()['startDate'];
      var endDate = patrol.data()['endDate'];
      var leader = patrol.data()['leader'];
      var members = patrol.data()['members'];
      var contactMatrix = patrol.data()['contactMatrix'];
      print(
          'patrol id ${patrol.id} start $startDate end $endDate leader $leader');
      print('start date as timestamp seconds ${startDate.seconds}');
      var startDateAsDate = startDate.toDate();
      print('start date as dateTime string $startDateAsDate');
      var startDateAsDateOnly =
          DateFormat('dd/MM/yyyy').format(startDateAsDate);
      print('start date $startDateAsDateOnly');
      var endDateAsDate = DateFormat('dd/MM/yyyy').format(endDate.toDate());
      print('end date $endDateAsDate');
      members.forEach((memberId) => print('patrol member ${memberId}'));
      contactMatrix.forEach((contact) => print('contact details $contact'));
    });
  }

  submitContact() async {
    try {
      getPatrols();
      //
    } catch (e) {
      print(e);
    }
    print(
        'user ${signedInUser.email} has submitted form with values - $ethnicity $gender age $age');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _oFormKey,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(color: kColorLightGrey001),
              ),
              //
              // heading
              //
              Expanded(
                flex: 1,
                child: Container(
                  color: kColorLightGrey002,
                  child: Center(
                    child: Text(
                      'New Contact',
                    ),
                  ),
                ),
              ),
              //
              // main data form
              //
              Expanded(
                flex: 20,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: kColorLightGrey003,
                      ),
                    ),
                    //
                    // form
                    //
                    Expanded(
                      flex: 18,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey004,
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey001,
                              child: Center(
                                child: Text('New Contact',
                                    style: kTextStyle40Bold),
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
                                      for (int i = 0;
                                          i < _selectedGender.length;
                                          i++) {
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
                                      for (int i = 0;
                                          i < _selectedAge.length;
                                          i++) {
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
                                      for (int i = 0;
                                          i < _selectedEthnicity.length;
                                          i++) {
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
                                  submitContact();
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

                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey004,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: kColorLightGrey003,
                      ),
                    ),
                  ],
                ),
              ),
              //
              // submit
              //
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(color: kColorLightGrey003),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: kColorLightGrey004,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Previous'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(color: kColorLightGrey003),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: kColorLightGrey004,
                        child: ElevatedButton(
                          onPressed: () {
                            goToContactMatrix();
                          },
                          child: Text('Next'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(color: kColorLightGrey003),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(color: kColorLightGrey001),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
