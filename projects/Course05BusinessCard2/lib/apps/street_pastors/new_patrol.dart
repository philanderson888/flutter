import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'patrol_page_01.dart';

class NewPatrol extends StatefulWidget {
  const NewPatrol({Key? key}) : super(key: key);

  @override
  State<NewPatrol> createState() => _NewPatrolState();
}

class _NewPatrolState extends State<NewPatrol> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  var textEditingControllerEmail;
  var textEditingControllerPassword;
  var email = '123@abc.com';
  var password = 'verySecure123';
  var location = 'Enfield';
  var patrolLeader = 'Phil';
  var cadNumber = '123ABC';
  var patrolMember = 'One';

  late var signedInUser;
  late TextEditingController textEditingControllerLocation;
  late TextEditingController dateController;
  late TextEditingController timeControllerStart;
  late TextEditingController timeControllerEnd;
  late TextEditingController textEditingControllerPatrolLeader;
  late TextEditingController textEditingControllerCadNumber;
  late var patrolMemberListView;
  late var patrolMemberWidget;

  String valueChanged = '2000-09-20';
  String valueToValidate = '2000-09-20';
  String valueSaved = '2000-09-20';

  @override
  initState() {
    print('street pastors new patrol');
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
    patrolMemberListView = ListView(
      children: patrolMembers,
    );
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
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PatrolPage01()));
  }

  var patrolMembers = [
    GestureDetector(onTap: () {}, child: Center(child: Text('Bob'))),
    GestureDetector(onTap: () {}, child: Center(child: Text('Harry'))),
    GestureDetector(onTap: () {}, child: Center(child: Text('Mildred'))),
    GestureDetector(onTap: () {}, child: Center(child: Text('George'))),
  ];

  addPatrolMember(String? newPatrolMember) {
    print('adding new member $newPatrolMember to patrol');
    setState(() => {
          if (newPatrolMember != null)
            {
              print('hello'),
              patrolMember = newPatrolMember,
              print('patrolMember $patrolMember'),
              patrolMemberWidget = GestureDetector(
                  onTap: () {}, child: Center(child: Text(patrolMember))),
              print('patrolMemberWidget $patrolMemberWidget'),
              patrolMembers.add(patrolMemberWidget),
              print(
                  'patrol has ${patrolMembers.length} members $patrolMembers'),
            },
        });
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
                      'New Patrol',
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
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey004,
                            ),
                          ),
                          //
                          // patrol date
                          //
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: DateTimePicker(
                                    type: DateTimePickerType.date,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2024),
                                    controller: dateController,
                                    dateLabelText: 'Date',
                                    locale: Locale('pt', 'BR'),
                                    onChanged: (value) =>
                                        {onDateChanged(value)},
                                    validator: (value) {
                                      setState(
                                          () => valueToValidate = value ?? ' ');
                                      return null;
                                    },
                                    onSaved: (value) => setState(
                                        () => valueSaved = value ?? ''),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey004,
                            ),
                          ),
                          //
                          // location
                          //
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: textEditingControllerLocation,
                              onChanged: (value) {
                                setLocation(value);
                              },
                              enableSuggestions: true,
                              autocorrect: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'location',
                                  hintStyle:
                                      TextStyle(color: kColorLightGrey02)),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: kColorLightGrey005,
                                  ),
                                ),
                                //
                                // start time
                                //
                                Expanded(
                                  flex: 1,
                                  child: DateTimePicker(
                                    type: DateTimePickerType.time,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2024),
                                    controller: timeControllerStart,
                                    timeLabelText: 'Start',
                                    locale: Locale('pt', 'BR'),
                                    onChanged: (value) =>
                                        {onDateChanged(value)},
                                    validator: (value) {
                                      setState(
                                          () => valueToValidate = value ?? ' ');
                                      return null;
                                    },
                                    onSaved: (value) => setState(
                                        () => valueSaved = value ?? ''),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: kColorLightGrey005,
                                  ),
                                ),
                                //
                                // end time
                                //
                                Expanded(
                                  flex: 1,
                                  child: DateTimePicker(
                                    type: DateTimePickerType.time,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2024),
                                    controller: timeControllerEnd,
                                    timeLabelText: 'End',
                                    locale: Locale('pt', 'BR'),
                                    onChanged: (value) =>
                                        {onDateChanged(value)},
                                    validator: (value) {
                                      setState(
                                          () => valueToValidate = value ?? ' ');
                                      return null;
                                    },
                                    onSaved: (value) => setState(
                                        () => valueSaved = value ?? ''),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: kColorLightGrey005,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey004,
                            ),
                          ),
                          //
                          // patrol leader
                          //
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: textEditingControllerPatrolLeader,
                              onChanged: (value) {
                                setPatrolLeader(value);
                              },
                              enableSuggestions: true,
                              autocorrect: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'patrol leader',
                                  hintStyle:
                                      TextStyle(color: kColorLightGrey02)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey004,
                            ),
                          ),

                          //
                          // patrol members
                          //

                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey003,
                              child: DropdownButton<String>(
                                  value: patrolMember,
                                  onTap: () => print('choose patrol member'),
                                  onChanged: (String? newPatrolMember) {
                                    addPatrolMember(newPatrolMember);
                                  },
                                  items: <String>['One', 'Two', 'Three']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList()),
                            ),
                          ),

                          //
                          // List View
                          //
                          Expanded(
                            flex: 4,
                            child: Container(
                              color: kColorLightGrey005,
                              child: patrolMemberListView,
                            ),
                          ),

                          //
                          // CAD number
                          //
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: textEditingControllerCadNumber,
                              onChanged: (value) {
                                setCadNumber(value);
                              },
                              enableSuggestions: true,
                              autocorrect: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Police CAD Number',
                                  hintStyle:
                                      TextStyle(color: kColorLightGrey02)),
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
                child: ElevatedButton(
                  onPressed: () {
                    startPatrol();
                  },
                  child: Text('Start Patrol'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(color: kColorLightGrey001),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
