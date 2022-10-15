import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_teaching_app/models/patrol_conversation.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/patrol.dart';
import 'package:flutter_teaching_app/constants.dart';
import '../../models/patrol_conversation.dart';

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

  final genders = ['Male', 'Female'];
  final ages = ['0-12', '13-17', '18-24', 'Over 25'];
  final ethnicities = ['White', 'Afro/Caribbean', 'Asian', 'East European'];

  final List<bool> _selectedGender = <bool>[false, false];
  final List<bool> _selectedAge = <bool>[false, false, false, false];
  final List<bool> _selectedEthnicity = <bool>[false, false, false, false];

  final List<Widget> genderWidgets = [];
  final List<Widget> ageWidgets = [];
  final List<Widget> ethnicityWidgets = [];

  var age = 'Over 25';
  var gender = 'Male';
  var ethnicity = 'White';

  var male = 0;
  var female = 0;
  var ageZeroTo12 = 0;
  var age13To17 = 0;
  var age18To24 = 0;
  var age25AndOver = 0;
  var ethnicWhite = 0;
  var ethnicAfroCaribbean = 0;
  var ethnicAsian = 0;
  var ethnicEastEuropean = 0;
  var contactName = '';
  var conversationNotes = '';

  late var loggedInUser;
  late String userId;
  late Patrol patrol;
  late String patrolId;
  late List<String> conversations;

  late TextEditingController textEditingControllerContactName;
  late TextEditingController textEditingControllerConversationNotes;

  @override
  initState() {
    print(
        '\n\nPatrol Conversation And Contact Matrix Page\n===========================================');
    super.initState();
    getLoggedInUser();

    patrol = widget.patrol;
    patrolId = patrol.patrolId;

    male = patrol.male;
    female = patrol.female;
    ageZeroTo12 = patrol.ageZeroTo12;
    age13To17 = patrol.age13To17;
    age18To24 = patrol.age18To24;
    age25AndOver = patrol.age25AndOver;
    ethnicWhite = patrol.ethnicWhite;
    ethnicAfroCaribbean = patrol.ethnicAfroCaribbean;
    ethnicAsian = patrol.ethnicAsian;
    ethnicEastEuropean = patrol.ethnicEastEuropean;
    conversations = patrol.conversations;

    initializeDateFormatting();

    textEditingControllerContactName = TextEditingController(text: '');
    textEditingControllerConversationNotes = TextEditingController(text: '');

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
          'user is logged in - email .. ${loggedInUser.email} .. uid .. $userId .. ');
    } catch (e) {
      print(e);
    }
  }

  updateGender(int index) {
    gender = genders[index].toString();
    print('selected gender is $gender');
    setState(() {
      for (int i = 0; i < _selectedGender.length; i++) {
        _selectedGender[i] = i == index;
      }
    });
  }

  updateAge(int index) {
    age = age[index].toString();
    print('selected age is $age');
    setState(() {
      for (int i = 0; i < _selectedGender.length; i++) {
        _selectedGender[i] = i == index;
      }
    });
  }

  setConversationName(String value) {
    final loForm = _oFormKey.currentState;
    if (loForm?.validate() == true) {
      loForm?.save();
      setState(() {
        contactName = value;
        print('Contact name is $contactName');
      });
    }
  }

  setConversationNotes(String value) {
    setState(() {
      conversationNotes = value;
      print('Conversation notes $conversationNotes');
    });
  }

  goToConversations() {
    print('going to conversations screen');
  }

  submitContact() async {
    int selectedGenderIndex = -1;
    for (int i = 0; i < _selectedGender.length; i++) {
      if (_selectedGender[i]) {
        selectedGenderIndex = i;
      }
    }
    if (selectedGenderIndex == 0) {
      male++;
    } else if (selectedGenderIndex == 1) {
      female++;
    }
    int selectedAgeIndex = -1;
    for (int i = 0; i < _selectedAge.length; i++) {
      if (_selectedAge[i]) {
        selectedAgeIndex = i;
      }
    }
    if (selectedAgeIndex == 0) {
      ageZeroTo12++;
    } else if (selectedAgeIndex == 1) {
      age13To17++;
    } else if (selectedAgeIndex == 2) {
      age18To24++;
    } else if (selectedAgeIndex == 3) {
      age25AndOver++;
    }

    int selectedEthnicityIndex = -1;
    for (int i = 0; i < _selectedEthnicity.length; i++) {
      if (_selectedEthnicity[i]) {
        selectedEthnicityIndex = i;
      }
    }
    if (selectedEthnicityIndex == 0) {
      ethnicWhite++;
    } else if (selectedEthnicityIndex == 1) {
      ethnicAfroCaribbean++;
    } else if (selectedEthnicityIndex == 2) {
      ethnicAsian++;
    } else if (selectedEthnicityIndex == 3) {
      ethnicEastEuropean++;
    }

    try {
      final patrolToUpdate = {
        'contactName': contactName,
        'conversationNotes': conversationNotes,
        'male': male,
        'female': female,
        'ageZeroTo12': ageZeroTo12,
        'age13to17': age13To17,
        'age18to24': age18To24,
        'age25AndOver': age25AndOver,
        'ethnicWhite': ethnicWhite,
        'ethnicAfroCaribbean': ethnicAfroCaribbean,
        'ethnicAsian': ethnicAsian,
        'ethnicEastEuropean': ethnicEastEuropean,
      };
      _firestore
          .collection('patrols')
          .doc(patrolId)
          .set(patrolToUpdate, SetOptions(merge: true));
      print(
          'patrol stats updated in firebase male $male 0-12 $ageZeroTo12 13-17 $age13To17 18-24 $age18To24 25+ $age25AndOver ');
      print('name $contactName notes $conversationNotes');
      print(
          'user ${loggedInUser.email} has submitted form with values - $ethnicity $gender age $age');
      setState(() {
        for (int i = 0; i < _selectedGender.length; i++) {
          _selectedGender[i] = false;
        }
        for (int i = 0; i < _selectedAge.length; i++) {
          _selectedAge[i] = false;
        }

        for (int i = 0; i < _selectedEthnicity.length; i++) {
          _selectedEthnicity[i] = false;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  submitConversation() async {
    try {
      var conversation = '$contactName::::$conversationNotes';
      conversations.add(conversation);
      final patrolToUpdate = {
        'conversations': conversations,
      };
      _firestore
          .collection('patrols')
          .doc(patrolId)
          .set(patrolToUpdate, SetOptions(merge: true));
      print('conversation updated in firebase name $conversation}');
      setState(() {
        contactName = '';
        conversationNotes = '';
        textEditingControllerContactName = TextEditingController(text: '');
        textEditingControllerConversationNotes =
            TextEditingController(text: '');
      });
    } catch (e) {
      print(e);
    }
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
                                    updateGender(index);
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
