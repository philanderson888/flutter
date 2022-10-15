import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_teaching_app/models/patrol_conversation.dart';
import 'new_patrol.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_teaching_app/models/patrol.dart';
import 'patrol_overview.dart';

class Patrols extends StatefulWidget {
  const Patrols({Key? key}) : super(key: key);

  @override
  State<Patrols> createState() => _PatrolsState();
}

class _PatrolsState extends State<Patrols> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late TextEditingController textEditingControllerEmail;
  late TextEditingController textEditingControllerPassword;
  var textEditingControllerLeader;
  var email = '123@abc.com';
  var password = 'verySecure123';
  var patrolId = '';
  var location = '';
  var leaderId = '';
  var leaderName = '';
  var cadNumber = '';
  var loggedInUser;
  var userId = '';
  late int bottleCount;
  late int peopleHelpedCount;
  late int peopleToSafetyCount;
  late List<String> conversations;

  late Map<String, String> member;
  var membersMapIdToName = Map<String, String>();
  late var memberName;
  late List<String> membersList;
  late String members;
  late Map<String, String> leaderNames;
  List<Patrol> patrols = [];
  var patrol = Patrol(
    startDate2: DateTime.now(),
    endDate2: DateTime.now(),
    leaderId2: '',
    leaderName2: '',
    location2: '',
    membersList2: [],
    members2: '',
    cadNumber2: '',
    userId2: '',
    bottleCount2: 0,
    peopleHelpedCount2: 0,
    peopleToSafetyCount2: 0,
    conversations2: [],
  );

  @override
  initState() {
    print('\n\nPatrols \n==============');
    print('patrols page has been loaded');
    super.initState();
    getUserAndPatrols();
  }

  getUserAndPatrols() async {
    await getLoggedInUser();
    await getPatrols();
  }

  getLoggedInUser() async {
    try {
      loggedInUser = await _auth.currentUser;
      userId = loggedInUser.uid;
      print(
          'patrols screen - user is signed in - email .. ${loggedInUser.email} .. uid .. $userId .. ');
    } catch (e) {
      print(e);
    }
  }

  getPatrols() async {
    print('getting patrol record from database ... waiting ...');
    print('.. searching for patrols where userId = $userId');
    final patrolRawData = await _firestore
        .collection('patrols')
        .orderBy('startDate', descending: true)
        .where('userId', isEqualTo: userId)
        .get();

    print('firebase patrol raw data received');
    final patrolsArray = patrolRawData.docs;
    print('firebase raw data converted to local patrol array data');
    final count = patrolsArray.length.toString();
    print('there are $count patrols');
    // think - is this necessary ? would be smarter to check if duplicates, and only add duplicates ...
    // just do this for now ... but think can do better ...
    patrols = [];
    patrolsArray.forEach((item) {
      var userId = item.data()['userId'];
      final startDate = item.data()['startDate'];
      final endDate = item.data()['endDate'];
      String leaderId = item.data()['leaderId'];
      if (leaderId == '') {
        print('leader id was an empty string');
        leaderId = 'no id';
      } else {
        print('leader id was present $leaderId');
      }
      var leaderName = item.data()['leaderName'] ?? '';
      var location = item.data()['location'] ?? '';
      var cadNumber = item.data()['cadNumber'] ?? '';
      var members = item.data()['members'] ?? '';
      var bottleCount = item.data()['bottleCount'] ?? 0;
      var peopleHelpedCount = item.data()['peopleHelpedCount'] ?? 0;
      var peopleToSafetyCount = item.data()['peopleToSafetyCount'] ?? 0;
      var male = item.data()['male'];
      var female = item.data()['female'];

      var ageZeroTo12 = item.data()['ageZeroTo12'] ?? 0;
      var age13To17 = item.data()['age13To17'] ?? 0;
      var age18To24 = item.data()['age18To24'] ?? 0;
      var age25AndOver = item.data()['age25AndOver'] ?? 0;

      var ethnicWhite = item.data()['ethnicWhite'];
      var ethnicAfroCaribbean = item.data()['ethnicAfroCaribbean'];
      var ethnicAsian = item.data()['ethnicAsian'];
      var ethnicEastEuropean = item.data()['ethnicEastEuropean'];

      print('start date as timestamp seconds ${startDate.seconds}');
      var startDateAsDate = startDate.toDate();
      print('start date as dateTime string $startDateAsDate');
      var startDateAsDateOnly =
          DateFormat('dd/MM/yyyy').format(startDateAsDate);
      print('start date $startDateAsDateOnly');

      var endDateAsDate = DateFormat('dd/MM/yyyy').format(endDate.toDate());
      print('end date $endDateAsDate');

      final conversationsAsDynamic = item.data()['conversations'] ?? [];
      var conversations = List<String>.from(conversationsAsDynamic);
      print(
          'conversations received from firebase as a list of ${conversations.length} items');
      conversations.forEach((conversationString) {
        print('conversation string is $conversationString');
      });

      /*
      List<PatrolConversation> conversationsList = [];
      for (var conversation in conversations) {
        var conversationClass = PatrolConversation(
            name2: conversation['name'], notes2: conversation['notes']);
        conversationsList.add(conversationClass);
        print(
            'conversation name ${conversationClass.name} notes ${conversationClass.notes}');
      }
       */

      final membersAsDynamic = item.data()['membersList'];
      membersList = List<String>.from(membersAsDynamic);
      membersList.forEach((memberId) => print('patrol member $memberId'));
      if (leaderId == 'no id') {
        leaderId = '';
      }

      var patrol = Patrol(
        // patrol stats
        startDate2: startDate.toDate(),
        endDate2: endDate.toDate(),
        leaderId2: leaderId,
        leaderName2: leaderName,
        location2: location,
        membersList2: membersList,
        members2: members,
        cadNumber2: cadNumber,
        userId2: userId,
        // helping statistics data
        bottleCount2: bottleCount,
        peopleHelpedCount2: peopleHelpedCount,
        peopleToSafetyCount2: peopleToSafetyCount,
        // encounter statistics data
        male2: male,
        female2: female,
        ageZeroToTwelve2: ageZeroTo12,
        ageThirteenToSeventeen2: age13To17,
        ageEighteenToTwentyFour2: age18To24,
        ageTwentyFiveAndOver2: age25AndOver,
        ethnicWhite2: ethnicWhite,
        ethnicAfroCaribbean2: ethnicAfroCaribbean,
        ethnicAsian2: ethnicAsian,
        ethnicEastEuropean2: ethnicEastEuropean,
        // conversation data
        conversations2: conversations,
      );
      patrol.setPatrolId(item.id);
      print('adding patrol from firebase to local array of patrols');
      print(patrol.toString());
      print(
          'patrol id ${item.id} start $startDate end $endDate leader $leaderName id $leaderId');
      print(
          'start ${DateFormat('dd/MM/yyyy').format(startDate.toDate())} end ${DateFormat('dd/MM/yyyy').format(endDate.toDate())} leader $leaderId $leaderName members ${members.length}');
      setState(() {
        addLeaderNameToPatrol(patrol);
        patrols.add(patrol);
      });
    });

    print('there are ' +
        patrols.length.toString() +
        ' patrols read from firebase into the local patrols array');
    patrols.forEach((patrol) {
      membersList.forEach((memberId) {
        memberName = getMemberNameFromId(memberId);
      });
    });
  }

  getMemberNameFromId(String memberId) async {
    final memberNameAsObject =
        await _firestore.collection('patrolMembers').doc(memberId).get();
    var memberFirstName = memberNameAsObject.get('firstName');
    var memberLastName = memberNameAsObject.get('lastName');
    var memberName = memberFirstName + ' ' + memberLastName;
    print('member id $memberId name $memberName');
    member = {memberId: memberName};
    membersMapIdToName.addAll(member);
  }

  addLeaderNameToPatrol(patrol) async {
    var memberAsObject;

    if (patrol.leaderId == null || patrol.leaderId == 'no id') {
      print('leader id ${patrol.leaderId} name ${patrol.leaderName}');
      setState(() {
        patrol.setLeaderName(patrol.leaderName);
      });
    } else {
      try {
        memberAsObject = await _firestore
            .collection('patrolMembers')
            .doc(patrol.leaderId)
            .get();

        if (memberAsObject == null) {
          leaderName = patrol.leaderName;
        } else {
          final leaderFirstName = memberAsObject.get('firstName');
          final leaderLastName = memberAsObject.get('lastName');
          leaderName = leaderFirstName + ' ' + leaderLastName;
        }
        print('leader id ${patrol.leaderId} name $leaderName');
        setState(() {
          patrol.setLeaderName(leaderName);
        });
      } catch (e) {
        print('leader id ${patrol.leaderId} name ${patrol.leaderName}');
        setState(() {
          patrol.setLeaderName(patrol.leaderName);
        });
      }
    }
  }

  refreshPatrols() {
    print('refreshing patrol list');
    getPatrols();
  }

  viewEditPatrol(int patrolIndex) {
    print(
        'trying to open up patrol for editing for patrol with index $patrolIndex');
    patrol = patrols[patrolIndex];
    Navigator.of(context).push(MaterialPageRoute<Patrol>(
        builder: (context) => PatrolOverview(patrol: patrol)));
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
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey003,
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        color: kColorLightGrey004,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: kColorLightGrey005,
                        child: GestureDetector(
                          onTap: () {
                            refreshPatrols();
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                'Refresh Patrols',
                                textAlign: TextAlign.center,
                              ),
                            ),
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
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: kColorLightGrey004,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: kColorLightGrey005,
                        child: GestureDetector(
                          onTap: () {
                            print('new patrol');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const NewPatrol()));
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                'New Patrol',
                                textAlign: TextAlign.center,
                              ),
                            ),
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
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey002,
                child: Center(
                  child: Text(
                    'Patrols',
                    style: kTextStyle20Bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                color: kColorLightGrey002,
                child: ListView.builder(
                    itemCount: patrols.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          print('patrol with index $index selected');
                        },
                        onDoubleTap: () {
                          viewEditPatrol(index);
                        },
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    patrols[index].getStartDate(),
                                    style: kTextStyle15,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    patrols[index].leaderName,
                                    style: kTextStyle15,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    patrols[index].location,
                                    style: kTextStyle15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey001,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
