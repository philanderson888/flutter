import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'patrol_details.dart';
import '../../models/patrol.dart';

class NewPatrol extends StatefulWidget {
  const NewPatrol({Key? key}) : super(key: key);

  @override
  State<NewPatrol> createState() => _NewPatrolState();
}

class _NewPatrolState extends State<NewPatrol> {
  final _oFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var email = '123@abc.com';
  var password = 'verySecure123';

  late var loggedInUser;
  var userId = '';

  late Patrol patrol;
  var location = '';
  var leaderId = '';
  var leaderName = '';
  var cadNumber = '';
  var members = '';

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(hours: 5));
  late String startTime;
  late String endTime;

  late TextEditingController dateController;
  late TextEditingController textEditingControllerLocation;
  late TextEditingController timeControllerStart;
  late TextEditingController timeControllerEnd;
  late TextEditingController textEditingControllerLeaderName;
  late TextEditingController textEditingControllerMembers;
  late TextEditingController textEditingControllerCadNumber;
  late var patrolMemberListView;
  late var patrolMemberWidget;

  // not used at present - use in later versions with more complex logic to identify individual patrol members
  var patrolMember = 'One';
  var membersList = [
    'gb387psJFhunLF40VPbM',
    'gb387psJFhunLF40VPbM',
    'gb387psJFhunLF40VPbM'
  ];

  String tempDate01 = '2000-09-20';
  String tempDate02 = '2000-09-20';

  @override
  initState() {
    print('street pastors new patrol');
    super.initState();
    getLoggedInUser();
    initializeDateFormatting();
    dateController = TextEditingController(text: startDate.toString());
    getStartAndEndTime();
    timeControllerStart = TextEditingController(text: startTime);
    timeControllerEnd = TextEditingController(text: endTime);
    textEditingControllerLocation = TextEditingController(text: location);
    textEditingControllerLeaderName = TextEditingController(text: leaderName);
    textEditingControllerCadNumber = TextEditingController(text: cadNumber);
    textEditingControllerMembers = TextEditingController(text: members);

    _getValue();

    patrol = Patrol(
      startDate2: startDate,
      endDate2: endDate,
      leaderId2: leaderId,
      leaderName2: leaderName,
      location2: location,
      membersList2: membersList,
      members2: members,
      cadNumber2: cadNumber,
      userId2: userId,
      conversations2: [],
    );

    patrolMemberListView = ListView(
      children: patrolMembersWidgetList,
    );
  }

  getLoggedInUser() async {
    try {
      loggedInUser = await _auth.currentUser;
      userId = loggedInUser.uid;
      print(
          'new patrol screen - user is logged in - email .. ${loggedInUser.email} .. uid .. $userId .. ');
    } catch (e) {
      print(e);
    }
  }

  String getStartAndEndTime() {
    startDate = DateTime.now();
    var startHour = TimeOfDay.now().hour;
    var endHour = (TimeOfDay.now().hour + 5);
    var endHourSubtractFullDays = endHour % 24;
    var addDay = 0;
    if (endHour != endHourSubtractFullDays) {
      addDay = 1;
    }
    String startHourAsString = startHour.toString().padLeft(2, '0');
    String endHourAsString = endHourSubtractFullDays.toString().padLeft(2, '0');
    int minute = TimeOfDay.now().minute;
    var minuteRounded = 5 * ((minute / 5).floor());
    String minuteRoundedAsString = minuteRounded.toString().padLeft(2, '0');
    startTime = '$startHourAsString:$minuteRoundedAsString';
    endTime = '$endHourAsString:$minuteRoundedAsString';
    startDate = DateTime(startDate.year, startDate.month, startDate.day,
        startHour, minuteRounded);
    endDate = DateTime(startDate.year, startDate.month, startDate.day + addDay,
        endHour, minuteRounded);
    print('startDate is $startDate, startTime is $startTime');
    print('endDate is $endDate, endTime is $endTime');
    return startTime;
  }

  String getTimeAsString(DateTime time) {
    String timeAsHours = time.hour.toString().padLeft(2, '0');
    var minutesRounded = 5 * ((time.minute / 5).floor());
    String timeAsMinutes = minutesRounded.toString().padLeft(2, '0');
    final timeAsString = '$timeAsHours:$timeAsMinutes';
    print('time as string is $timeAsString');
    return timeAsString;
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      dateController.text = DateTime.now().toString();
    });
  }

  //
  // navigation
  //
  goToPatrols() {
    Navigator.pop(context);
  }

  onDateChanged(String value) {
    print('date has changed - incoming raw data is $value');
    setState(() {
      tempDate02 = value;
      final startDateParsed = DateTime.parse(value);
      print('start date parsed $startDateParsed');
      final startTimeParsed = DateFormat('HH:mm').parse(startTime);
      print('start time parsed $startTimeParsed');
      final endTimeParsed = DateFormat('HH:mm').parse(endTime);
      print('end time parsed $endTimeParsed');
      startDate = DateTime(startDateParsed.year, startDateParsed.month,
          startDateParsed.day, startTimeParsed.hour, startTimeParsed.minute);
      print('start date $startDate');
      endDate = DateTime(startDateParsed.year, startDateParsed.month,
          startDateParsed.day, endTimeParsed.hour, endTimeParsed.minute);
      print('end date $endDate');
    });
  }

  onStartTimeChanged(String value) {
    final startTimeParsed = DateFormat('HH:mm').parse(value);
    print('start time has changed to $startTimeParsed');
    setState(() {
      startDate = DateTime(startDate.year, startDate.month, startDate.day,
          startTimeParsed.hour, startTimeParsed.minute);
      startTime = value;
      print('start date $startDate time $startTime');
    });
  }

  onEndTimeChanged(String value) {
    final endTimeParsed = DateFormat('HH:mm').parse(value);
    print('end time has changed to $endTimeParsed');
    setState(() {
      endDate = DateTime(endDate.year, endDate.month, endDate.day,
          endTimeParsed.hour, endTimeParsed.minute);
      endTime = value;
      print('end date $endDate time $endTime');
    });
  }

  setLocation(String value) {
    setState(() {
      location = value;
      print('Location has changed to $location');
    });
  }

  setLeaderName(String value) {
    setState(() {
      leaderName = value;
      print('Patrol leader is $leaderName');
    });
  }

  setMembers(String value) {
    setState(() {
      members = value;
      print('Patrol members are $members');
    });
  }

  setCadNumber(String value) {
    setState(() {
      cadNumber = value;
      print('CAD Number $cadNumber');
    });
  }

  createPatrol() {
    final loForm = _oFormKey.currentState;
    if (loForm?.validate() == true) {
      loForm?.save();
      patrol = Patrol(
        startDate2: startDate,
        endDate2: endDate,
        leaderId2: leaderId,
        leaderName2: leaderName,
        location2: location,
        membersList2: membersList,
        members2: members,
        cadNumber2: cadNumber,
        userId2: userId,
        conversations2: [],
      );
      try {
        _firestore.collection('patrols').add({
          'startDate': patrol.startDate,
          'endDate': patrol.endDate,
          'leaderId': patrol.leaderId,
          'leaderName': patrol.leaderName,
          'location': patrol.location,
          'membersList': patrol.membersList,
          'members': patrol.members,
          'cadNumber': cadNumber,
          'userId': userId,
        }).then((documentSnapshot) => {
              print(
                  'firebase new patrol created with fresh id ${documentSnapshot.id}'),
              print(
                  'new patrol created in firebase ${patrol.getStartDate()} ${patrol.location} leader ${patrol.leaderName} leaderId ${patrol.leaderId} members $members membersList ${membersList.toString()}'),
              patrol.setPatrolId(documentSnapshot.id),
            });
        Navigator.of(context).push(MaterialPageRoute<Patrol>(
            builder: (context) => PatrolDetails(patrol: patrol)));
      } catch (e) {
        print(e);
      }
    }
  }

  viewPatrol() {
    print('view patrol details');
    final loForm = _oFormKey.currentState;
    if (loForm?.validate() == true) {
      loForm?.save();
      Navigator.of(context).push(MaterialPageRoute<Patrol>(
          builder: (context) => PatrolDetails(patrol: patrol)));
    }
  }

  var patrolMembersWidgetList = [
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
              patrolMembersWidgetList.add(patrolMemberWidget),
              print(
                  'patrol has ${patrolMembersWidgetList.length} members $patrolMembersWidgetList'),
            },
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _oFormKey,
          child: Container(
            color: kPatrolLight001,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(color: kPatrolLight001),
                ),
                //
                // heading
                //
                Expanded(
                  flex: 1,
                  child: Container(
                    color: kPatrolLight001,
                    child: Center(
                      child: Text(
                        'New Patrol',
                        style: kTextStyle20Bold,
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
                          color: kPatrolLight001,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: kPatrolLight001,
                              ),
                            ),
                            //
                            // patrol date
                            //
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: kPatrolLight001,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: kPatrolLight001,
                                      child: DateTimePicker(
                                        type: DateTimePickerType.date,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2024),
                                        controller: dateController,
                                        dateLabelText: 'Date',
                                        //locale: Locale('pt', 'BR'),
                                        onChanged: (value) =>
                                            {onDateChanged(value)},
                                        validator: (value) {
                                          setState(
                                              () => tempDate01 = value ?? ' ');
                                          return null;
                                        },
                                        onSaved: (value) => setState(
                                            () => tempDate02 = value ?? ''),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),

                            //
                            // start and end times
                            //

                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
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
                                      onChanged: (value) =>
                                          {onStartTimeChanged(value)},
                                      validator: (value) {
                                        setState(
                                            () => tempDate01 = value ?? ' ');
                                        return null;
                                      },
                                      onSaved: (value) => setState(
                                          () => tempDate02 = value ?? ''),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
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
                                      onChanged: (value) =>
                                          {onEndTimeChanged(value)},
                                      validator: (value) {
                                        setState(
                                            () => tempDate01 = value ?? ' ');
                                        return null;
                                      },
                                      onSaved: (value) => setState(
                                          () => tempDate02 = value ?? ''),
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

                            //
                            // location
                            //
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: textEditingControllerLocation,
                                onChanged: (value) {
                                  setLocation(value);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter location';
                                  }
                                  return null;
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
                              child: Container(),
                            ),

                            //
                            // patrol leader
                            //
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: textEditingControllerLeaderName,
                                onChanged: (value) {
                                  setLeaderName(value);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter leader name';
                                  }
                                  return null;
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
                              child: Container(),
                            ),

                            //
                            // patrol members
                            //
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: textEditingControllerMembers,
                                onChanged: (value) {
                                  setMembers(value);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter patrol member names';
                                  }
                                  return null;
                                },
                                enableSuggestions: true,
                                autocorrect: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'patrol members',
                                    hintStyle:
                                        TextStyle(color: kColorLightGrey02)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),

                            Visibility(
                              visible: false,
                              child: Expanded(
                                flex: 1,
                                child: Container(
                                  color: kPatrolLight003,
                                  child: DropdownButton<String>(
                                      value: patrolMember,
                                      onTap: () =>
                                          print('choose patrol member'),
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
                            ),

                            //
                            // List View
                            //

                            Visibility(
                              visible: false,
                              child: Expanded(
                                flex: 4,
                                child: Container(
                                  color: kPatrolDark002,
                                  child: patrolMemberListView,
                                ),
                              ),
                            ),

                            //
                            // CAD number
                            //
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: textEditingControllerCadNumber,
                                onChanged: (value) {
                                  setCadNumber(value);
                                },
                                validator: (value) {
                                  return null;
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
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: kPatrolLight001,
                        ),
                      ),
                    ],
                  ),
                ),
                //
                // create patrol
                //
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(color: kColorLightGrey001),
                      ),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: goToPatrols,
                          child: Text('Cancel'),
                          style: kButtonStyleCancel,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: createPatrol,
                          child: Text('Create Patrol'),
                          style: kButtonStyleUpdate,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: kColorLightGrey001),
                      ),
                    ],
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
      ),
    );
  }
}
