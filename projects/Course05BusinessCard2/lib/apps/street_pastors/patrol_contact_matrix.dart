import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/patrol.dart';
import 'package:flutter_teaching_app/constants.dart';

class PatrolContactMatrix extends StatefulWidget {
  const PatrolContactMatrix({Key? key, required this.patrol}) : super(key: key);

  final Patrol patrol;

  @override
  State<PatrolContactMatrix> createState() => _PatrolContactMatrixState();
}

class _PatrolContactMatrixState extends State<PatrolContactMatrix> {
  final GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var patrolId = 'this is a patrol id';
  var location = 'Enfield';
  var patrolLeader = 'Phil';
  var cadNumber = '123ABC';
  var members = '';

  final genders = ['Male', 'Female'];
  final ages = ['0-12', '13-17', '18-24', 'Over 25'];
  final ethnicities = ['White', 'Afro/Caribbean', 'Asian', 'East European'];

  final List<bool> _selectedGender = <bool>[true, false];
  final List<bool> _selectedAge = <bool>[false, false, false, true];
  final List<bool> _selectedEthnicity = <bool>[true, false, false, false];

  final List<Widget> genderWidgets = [];
  final List<Widget> ageWidgets = [];
  final List<Widget> ethnicityWidgets = [];

  var age = 'Over 25';
  var gender = 'Male';
  var ethnicity = 'White';

  var male = 0;
  var female = 0;
  var ageUpTo12 = 0;
  var age13To17 = 0;
  var age18To24 = 0;
  var age25AndOver = 0;
  var ethnicWhite = 0;
  var ethnicAfroCaribbean = 0;
  var ethnicAsian = 0;
  var ethnicEastEuropean = 0;

  var conversations = [];
  var conversationName = 'Rob';
  var conversationNotes = 'we had a conversation';

  late var loggedInUser;
  late String userId;
  late Patrol patrol;

  late TextEditingController textEditingControllerEmail;
  late TextEditingController textEditingControllerPassword;
  late TextEditingController textEditingControllerLocation;
  late TextEditingController dateController;
  late TextEditingController timeControllerStart;
  late TextEditingController timeControllerEnd;
  late TextEditingController textEditingControllerPatrolLeader;
  late TextEditingController textEditingControllerCadNumber;
  late TextEditingController textEditingControllerContactName;
  late TextEditingController textEditingControllerConversationNotes;
  late int bottleCount;
  late int peopleHelpedCount;
  late int peopleToSafetyCount;

  // refactor
  String valueToValidate = '2000-09-20';
  String valueSaved = '2000-09-20';

  @override
  initState() {
    print('\n\nPatrol Conversation And Contact Matrix Page\n==============');
    super.initState();
    getLoggedInUser();

    patrol = widget.patrol;
    male = patrol.male;
    female = patrol.female;
    ageUpTo12 = patrol.ageUpTo12;
    age13To17 = patrol.age13To17;
    age18To24 = patrol.age18To24;
    age25AndOver = patrol.age25AndOver;
    ethnicWhite = patrol.ethnicWhite;
    ethnicAfroCaribbean = patrol.ethnicAfroCaribbean;
    ethnicEastEuropean = patrol.ethnicEastEuropean;
    bottleCount = patrol.bottleCount;
    peopleHelpedCount = patrol.peopleHelpedCount;
    peopleToSafetyCount = patrol.peopleToSafetyCount;

    initializeDateFormatting();
    dateController = TextEditingController(
        text: DateTime.now().subtract(const Duration(days: 1)).toString());
    timeControllerStart = TextEditingController(text: getRoundedTimeNow());
    timeControllerEnd = TextEditingController(text: getRoundedTimeThen());
    textEditingControllerLocation = TextEditingController(text: location);
    textEditingControllerPatrolLeader =
        TextEditingController(text: patrolLeader);
    textEditingControllerCadNumber = TextEditingController(text: cadNumber);
    textEditingControllerContactName =
        TextEditingController(text: 'contact name');
    textEditingControllerConversationNotes =
        TextEditingController(text: 'conversation notes');

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

  setConversationName(String value) {
    setState(() {
      conversationName = value;
      print('Contact name is $conversationName');
    });
  }

  setConversationNotes(String value) {
    setState(() {
      conversationNotes = value;
      print('Conversation notes $conversationNotes');
    });
  }

  startPatrol() {
    print('patrol is being started');
    final loForm = _oFormKey.currentState;
    if (loForm?.validate() == true) {
      loForm?.save();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PatrolContactMatrix(patrol: patrol)));
  }

  goToContactMatrix() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PatrolContactMatrix(patrol: patrol)));
  }

  goToConversations() {
    print('going to conversations screen');
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
      members.forEach((memberId) => print('patrol member $memberId'));
      contactMatrix.forEach((contact) => print('contact details $contact'));
    });
  }

  submitContact() async {
    try {
      final patrolToUpdate = {
        'male': male,
        'female': female,
        'ageUpTo12': ageUpTo12,
        'age13to17': age13To17,
        'age18to24': age18To24,
        'age25AndOver': age25AndOver,
        'ethnicWhite': ethnicWhite,
        'ethicAfroCaribbean': ethnicAfroCaribbean,
        'ethnicAsian': ethnicAsian,
        'ethnicEastEuropean': ethnicEastEuropean,
      };
      _firestore
          .collection('patrols')
          .doc(patrolId)
          .set(patrolToUpdate, SetOptions(merge: true));
      print(
          'patrol stats updated in firebase male $male 0-12 $ageUpTo12 13-17 $age13To17 18-24 $age18To24 25+ $age25AndOver ');
    } catch (e) {
      print(e);
    }
    print(
        'user ${loggedInUser.email} has submitted form with values - $ethnicity $gender age $age');
  }

  submitConversation() async {
    try {
      _firestore.collection('patrolConversations').add({
        'ageRange': age,
        'conversationNotes': conversationNotes,
        'ethnicity': ethnicity,
        'gender': gender,
        'name': conversationName,
        'patrolId': patrolId,
      });
    } catch (e) {
      print(e);
    }
    print(
        'user ${loggedInUser.email} has submitted form with values - $ethnicity $gender age $age');
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
                    child: Text('Contact Matrix', style: kTextStyle20Bold),
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
                              color: kColorLightGrey002,
                              child: const Center(
                                child: Center(child: Text('')),
                              ),
                            ),
                          ),
                          //
                          // gender
                          //
                          Expanded(
                            flex: 3,
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
                              child: const Center(child: Text('')),
                            ),
                          ),
                          //
                          // age
                          //
                          Expanded(
                            flex: 3,
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
                              child: const Center(child: Text('')),
                            ),
                          ),
                          //
                          // ethnicity
                          //
                          Expanded(
                            flex: 3,
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
                              child: const Center(child: Text('')),
                            ),
                          ),

                          //
                          // submit contact matrix
                          //
                          Expanded(
                            flex: 3,
                            child: Container(
                              color: kColorLightGrey001,
                              child: GestureDetector(
                                onTap: () {
                                  submitContact();
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: kColorLightGrey002,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        color: kColorLightGrey003,
                                        child: const Center(
                                          child: Center(
                                              child: Text(
                                                  'Submit Contact Matrix')),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: kColorLightGrey002,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey002,
                              child: const Center(child: Text('')),
                            ),
                          ),

                          //
                          // heading conversation
                          //

                          Expanded(
                            flex: 2,
                            child: Container(
                              color: kColorLightGrey002,
                              child: Center(
                                child: Text('Conversation',
                                    style: kTextStyle20Bold),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey002,
                              child: const Center(child: Text('')),
                            ),
                          ),

                          //
                          // contact name
                          //
                          Expanded(
                            flex: 2,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: textEditingControllerContactName,
                              onChanged: (value) {
                                setConversationName(value);
                              },
                              enableSuggestions: true,
                              autocorrect: true,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'contact name',
                                  hintStyle:
                                      TextStyle(color: kColorLightGrey02)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey002,
                              child: const Center(child: Text('')),
                            ),
                          ),

                          //
                          // conversation notes
                          //
                          Expanded(
                            flex: 11,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller:
                                  textEditingControllerConversationNotes,
                              onChanged: (value) {
                                setConversationNotes(value);
                              },
                              enableSuggestions: true,
                              autocorrect: true,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'conversation notes',
                                  hintStyle:
                                      TextStyle(color: kColorLightGrey02)),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey002,
                              child: Container(),
                            ),
                          ),

                          //
                          // submit conversation
                          //

                          Expanded(
                            flex: 2,
                            child: Container(
                              color: kColorLightGrey001,
                              child: GestureDetector(
                                onTap: () {
                                  submitConversation();
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: kColorLightGrey002,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        color: kColorLightGrey003,
                                        child: Center(
                                            child: Text(
                                          'Submit Conversation',
                                          textAlign: TextAlign.center,
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: kColorLightGrey002,
                                      ),
                                    ),
                                  ],
                                ),
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
                      flex: 3,
                      child: Container(
                        color: kColorLightGrey004,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Patrol Details'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(color: kColorLightGrey003),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: kColorLightGrey004,
                        child: ElevatedButton(
                          onPressed: () {
                            goToConversations();
                          },
                          child: const Text('Conversations'),
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
