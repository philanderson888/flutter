import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'patrol_contact_matrix.dart';
import 'package:flutter_teaching_app/models/patrol.dart';
import 'patrol_overview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatrolDetails extends StatefulWidget {
  const PatrolDetails({Key? key, required this.patrol}) : super(key: key);

  final Patrol patrol;

  @override
  State<PatrolDetails> createState() => _PatrolDetailsState();
}

class _PatrolDetailsState extends State<PatrolDetails> {
  final GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  late var loggedInUser;
  late Patrol patrol;
  late String patrolId;
  late int bottleCount;
  late int peopleHelpedCount;
  late int peopleToSafetyCount;

  // refactor
  String valueToValidate = '2000-09-20';
  String valueSaved = '2000-09-20';

  @override
  initState() {
    print('\n\nPatrol Details\n==============');
    print('patrol details page has been loaded');
    super.initState();
    getLoggedInUser();
    patrol = widget.patrol;
    patrolId = patrol.patrolId;
    bottleCount = patrol.bottleCount;
    peopleHelpedCount = patrol.peopleHelpedCount;
    peopleToSafetyCount = patrol.peopleToSafetyCount;
    print(
        'patrol has been loaded from database id $patrolId leader ${patrol.leaderName} bottleCount $bottleCount people helped $peopleHelpedCount people to safety $peopleToSafetyCount');
    print('patrol ${patrol.toString()}');
    initializeDateFormatting();
  }

  getLoggedInUser() async {
    try {
      loggedInUser = await _auth.currentUser;
      print(
          'new patrol screen - user is logged in - email .. ${loggedInUser.email} .. uid .. ${loggedInUser.uid} .. ');
    } catch (e) {
      print(e);
    }
  }

  //
  // navigation
  //

  goToPatrolOverview() {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute<Patrol>(
        builder: (context) => PatrolOverview(patrol: patrol)));
  }

  goToContactMatrix() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PatrolContactMatrix(patrol: patrol)));
  }

  incrementBottleCount(int increment) {
    print('bottle counter clicked');

    if (bottleCount == 0 && increment == INCREMENT['negative']) {
      return;
    }

    setState(() {
      bottleCount += increment;
      patrol.bottleCount = bottleCount;
      print('bottle count now at $bottleCount');
    });
    try {
      final patrolToUpdate = {
        'bottleCount': bottleCount,
      };
      _firestore
          .collection('patrols')
          .doc(patrolId)
          .set(patrolToUpdate, SetOptions(merge: true));
      print(
          'bottle count updated in firebase patrol $patrolId bottleCount $bottleCount');
    } catch (e) {
      print(e);
    }
  }

  incrementPeopleHelpedCount(int increment) {
    print('people helped counter clicked');

    if (peopleHelpedCount == 0 && increment == INCREMENT['negative']) {
      return;
    }

    setState(() {
      peopleHelpedCount += increment;
      patrol.peopleHelpedCount = peopleHelpedCount;
      print('people helped count now at $peopleHelpedCount');
    });
    try {
      final patrolToUpdate = {
        'peopleHelpedCount': peopleHelpedCount,
      };
      _firestore
          .collection('patrols')
          .doc(patrolId)
          .set(patrolToUpdate, SetOptions(merge: true));
      print(
          'people helped count updated in firebase patrol $patrolId bottleCount $peopleHelpedCount');
    } catch (e) {
      print(e);
    }
  }

  incrementPeopleToSafetyCount(int increment) {
    print('people to safety counter clicked');

    if (peopleToSafetyCount == 0 && increment == INCREMENT['negative']) {
      return;
    }

    setState(() {
      peopleToSafetyCount += increment;
      patrol.peopleToSafetyCount = peopleToSafetyCount;
      print('people helped count now at $peopleToSafetyCount');
    });
    try {
      final patrolToUpdate = {
        'peopleToSafetyCount': peopleToSafetyCount,
      };
      _firestore
          .collection('patrols')
          .doc(patrolId)
          .set(patrolToUpdate, SetOptions(merge: true));
      print(
          'people to safety updated in firebase patrol $patrolId bottleCount $peopleToSafetyCount');
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
                    child: Text(
                      'Patrol Details',
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
                      flex: 10,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey004,
                            ),
                          ),
                          //
                          // bottle counter
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
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    color: kColorLightGrey006,
                                    child: Text('Bottles', style: kTextStyle35),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: kColorLightGrey005,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: kColorLightGrey006,
                                    child: Center(
                                      child: Text(bottleCount.toString(),
                                          style: kTextStyle40Bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: kColorLightGrey005,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: kColorLightGrey002,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: GestureDetector(
                                          onTap: () {
                                            incrementBottleCount(1);
                                          },
                                          child: Container(
                                            color: kColorLightGrey003,
                                            child: Center(
                                              child: Text('+',
                                                  style: kTextStyle20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: kColorLightGrey002,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: GestureDetector(
                                          onTap: () {
                                            incrementBottleCount(-1);
                                          },
                                          child: Container(
                                            color: kColorLightGrey003,
                                            child: Center(
                                              child: Text('-',
                                                  style: kTextStyle20),
                                            ),
                                          ),
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
                          // people helped
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
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    color: kColorLightGrey006,
                                    child: Text('People Helped',
                                        style: kTextStyle30),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: kColorLightGrey005,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: kColorLightGrey006,
                                    child: Center(
                                      child: Text(peopleHelpedCount.toString(),
                                          style: kTextStyle40Bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: kColorLightGrey005,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: kColorLightGrey002,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: GestureDetector(
                                          onTap: () {
                                            incrementPeopleHelpedCount(1);
                                          },
                                          child: Container(
                                            color: kColorLightGrey003,
                                            child: Center(
                                              child: Text('+',
                                                  style: kTextStyle20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: kColorLightGrey002,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: GestureDetector(
                                          onTap: () {
                                            incrementPeopleHelpedCount(-1);
                                          },
                                          child: Container(
                                            color: kColorLightGrey003,
                                            child: Center(
                                              child: Text('-',
                                                  style: kTextStyle20),
                                            ),
                                          ),
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
                          // people accompanied / observed to safety
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
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    color: kColorLightGrey006,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'People',
                                              style: kTextStyle20,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'accompanied',
                                              style: kTextStyle20,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '/ observed',
                                              style: kTextStyle20,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'to safety',
                                              style: kTextStyle20,
                                            ),
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
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: kColorLightGrey005,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: kColorLightGrey006,
                                    child: Center(
                                      child: Text(
                                          peopleToSafetyCount.toString(),
                                          style: kTextStyle40Bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: kColorLightGrey005,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: kColorLightGrey002,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: GestureDetector(
                                          onTap: () {
                                            incrementPeopleToSafetyCount(1);
                                          },
                                          child: Container(
                                            color: kColorLightGrey003,
                                            child: Center(
                                              child: Text('+',
                                                  style: kTextStyle20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: kColorLightGrey002,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: GestureDetector(
                                          onTap: () {
                                            incrementPeopleToSafetyCount(-1);
                                          },
                                          child: Container(
                                            color: kColorLightGrey003,
                                            child: Center(
                                              child: Text('-',
                                                  style: kTextStyle20),
                                            ),
                                          ),
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
                      flex: 5,
                      child: Container(
                        color: kColorLightGrey004,
                        child: ElevatedButton(
                          onPressed: goToPatrolOverview,
                          child: Text('Patrol Overview'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(color: kColorLightGrey003),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: kColorLightGrey004,
                        child: ElevatedButton(
                          onPressed: () {
                            goToContactMatrix();
                          },
                          child: Text('Contact Matrix'),
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
