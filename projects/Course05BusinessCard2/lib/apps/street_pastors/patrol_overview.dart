import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_teaching_app/models/patrol_conversation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'patrol_details.dart';
import '../../models/patrol.dart';

class PatrolOverview extends StatefulWidget {
  const PatrolOverview({Key? key, required this.patrol}) : super(key: key);

  final Patrol patrol;

  @override
  State<PatrolOverview> createState() => _PatrolOverviewState();
}

class _PatrolOverviewState extends State<PatrolOverview> {
  final _oFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var mode = MODE.READ_ONLY;

  late TextEditingController textEditingControllerEmail;
  late TextEditingController textEditingControllerPassword;
  var email = '123@abc.com';
  var password = 'verySecure123';
  var patrolId = '';

  var patrolMember = 'One';
  var membersList = [
    'gb387psJFhunLF40VPbM',
    'gb387psJFhunLF40VPbM',
    'gb387psJFhunLF40VPbM'
  ];

  late var loggedInUser;
  late Patrol patrol;
  late Patrol patrolBeforeChanges;
  late TextEditingController textEditingControllerLocation;
  late TextEditingController dateController;
  late TextEditingController timeControllerStart;
  late TextEditingController timeControllerEnd;
  late TextEditingController textEditingControllerLeaderName;
  late TextEditingController textEditingControllerMembers;
  late TextEditingController textEditingControllerCadNumber;
  late ListView patrolMemberListView;
  late var patrolMemberWidget;
  late DateTime startDate;
  late DateTime endDate;
  late String startTime;
  late String endTime;
  late String location;
  late String leaderId;
  late String leaderName;
  late String cadNumber;
  late String members;
  late String userId;
  late int bottleCount;
  late int peopleHelpedCount;
  late int peopleToSafetyCount;
  late List<String> conversations;

  String valueChanged = '2000-09-20';
  String valueToValidate = '2000-09-20';
  String valueSaved = '2000-09-20';

  @override
  initState() {
    print('\n\nPatrol Overview\n==============');
    print('patrol overview page has been loaded - view/update patrol');
    super.initState();
    getLoggedInUser();

    patrol = widget.patrol;
    patrolBeforeChanges = patrol;
    startDate = patrol.startDate;
    endDate = patrol.endDate;
    location = patrol.location;
    leaderName = patrol.leaderName;
    leaderId = patrol.leaderId;
    members = patrol.members;
    cadNumber = patrol.cadNumber;
    bottleCount = patrol.bottleCount;
    peopleHelpedCount = patrol.peopleHelpedCount;
    peopleToSafetyCount = patrol.peopleToSafetyCount;
    conversations = patrol.conversations;

    print('existing patrol passed in');
    print(patrol.toString());

    initializeDateFormatting();
    dateController = TextEditingController(text: startDate.toString());
    timeControllerStart = TextEditingController(text: getTime(startDate));
    timeControllerEnd = TextEditingController(text: getTime(endDate));
    textEditingControllerLocation = TextEditingController(text: location);
    textEditingControllerLeaderName = TextEditingController(text: leaderName);
    textEditingControllerCadNumber = TextEditingController(text: cadNumber);
    textEditingControllerMembers = TextEditingController(text: members);

    _getValueOnInit();

    patrolMemberListView = ListView(
      children: patrolMembersWidgetList,
    );
  }

  getLoggedInUser() async {
    try {
      loggedInUser = await _auth.currentUser;
      userId = loggedInUser.uid;
      print(
          'view / update patrol - user is logged in - email .. ${loggedInUser.email} .. uid .. $userId .. ');
    } catch (e) {
      print(e);
    }
  }

  String getTime(DateTime dateTime) {
    String lsHour = dateTime.hour.toString().padLeft(2, '0');
    String lsMinute = dateTime.minute.toString().padLeft(2, '0');
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
  Future<void> _getValueOnInit() async {
    await Future.delayed(const Duration(seconds: 3), () {
      dateController.text = DateTime.now().toString();
    });
  }

  //
  // navigation
  //

  cancelUpdate() {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute<Patrol>(
        builder: (context) => PatrolOverview(patrol: patrolBeforeChanges)));
  }

  goToPatrols() {
    Navigator.pop(context);
  }

  goToPatrolDetails() {
    print('go to patrol details');
    final loForm = _oFormKey.currentState;
    if (loForm?.validate() == true) {
      loForm?.save();
      print('sending this patrol to patrol details screen');
      print(patrol.toString());
      Navigator.of(context).push(MaterialPageRoute<Patrol>(
          builder: (context) => PatrolDetails(patrol: patrol)));
    }
  }

  onDateChanged(String value) {
    print('date has changed');
    setState(() {
      mode = MODE.UPDATE;
      valueSaved = value;
    });
  }

  setLocation(String value) {
    setState(() {
      mode = MODE.UPDATE;
      location = value;
      print('Location has changed to $location');
    });
  }

  setLeaderName(String value) {
    setState(() {
      mode = MODE.UPDATE;
      leaderName = value;
      print('Patrol leader is $leaderName');
    });
  }

  setCadNumber(String value) {
    setState(() {
      mode = MODE.UPDATE;
      cadNumber = value;
      print('CAD Number $cadNumber');
    });
  }

  updatePatrol() {
    final loForm = _oFormKey.currentState;
    if (loForm?.validate() == true) {
      loForm?.save();
      patrolId = patrol.patrolId;
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
        conversations2: conversations,
      );
      patrol.patrolId = patrolId;

      try {
        final patrolToUpdate = {
          'startDate': patrol.startDate,
          'endDate': patrol.endDate,
          'leaderId': patrol.leaderId,
          'leaderName': patrol.leaderName,
          'location': patrol.location,
          'membersList': patrol.membersList,
          'members': patrol.members,
        };

        _firestore
            .collection('patrols')
            .doc(patrolId)
            .set(patrolToUpdate, SetOptions(merge: true));
        print(
            'patrol updated in firebase ${patrol.patrolId} ${patrol.getStartDate()} ${patrol.location} leader ${patrol.leaderName} leaderId ${patrol.leaderId} members $members membersList ${membersList.toString()}');
        goToPatrolDetails();
      } catch (e) {
        print(e);
      }
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
                      'Existing Patrol',
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
                            flex: 2,
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

                          //
                          // start and end times
                          //

                          Expanded(
                            flex: 2,
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
                            child: Container(
                              color: kColorLightGrey004,
                            ),
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
                            child: Container(
                              color: kColorLightGrey004,
                            ),
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
                                setLeaderName(value);
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
                            child: Container(
                              color: kColorLightGrey004,
                            ),
                          ),

                          Visibility(
                            visible: false,
                            child: Expanded(
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
                          ),

                          //
                          // List View
                          //

                          Visibility(
                            visible: false,
                            child: Expanded(
                              flex: 4,
                              child: Container(
                                color: kColorLightGrey005,
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
              // create patrol
              //
              Visibility(
                visible: mode == MODE.READ_ONLY,
                child: Expanded(
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
                          child: Text('Patrols'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: kColorLightGrey001),
                      ),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: goToPatrolDetails,
                          child: Text('Patrol Details'),
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
              Visibility(
                visible: mode == MODE.UPDATE,
                child: Expanded(
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
                          onPressed: cancelUpdate,
                          child: Text('Cancel'),
                          style: kButtonStyleCancel,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: kColorLightGrey001),
                      ),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: updatePatrol,
                          child: Text('Update'),
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
