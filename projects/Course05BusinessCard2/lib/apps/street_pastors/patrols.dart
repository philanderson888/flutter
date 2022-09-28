import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'new_patrol.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Patrols extends StatefulWidget {
  const Patrols({Key? key}) : super(key: key);

  @override
  State<Patrols> createState() => _PatrolsState();
}

class _PatrolsState extends State<Patrols> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var textEditingControllerEmail;
  var textEditingControllerPassword;
  var email = '123@abc.com';
  var password = 'verySecure123';
  late var signedInUser;
  late var patrolListView;

  var patrols = [
    GestureDetector(
      onTap: () {},
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Date',
                  style: kTextStyle15Bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Leader',
                  style: kTextStyle15Bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        print('requesting to see patrol details');
      },
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text('1/1/2000'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text('Geoge'),
              ),
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        print('requesting to see patrol details');
      },
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text('1/1/2000'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text('Geoge'),
              ),
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        print('requesting to see patrol details');
      },
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text('1/1/2000'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text('Geoge'),
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  initState() {
    super.initState();
    print('street pastors patrols');
    getSignedInUser();
    getPatrols();
    patrolListView = ListView(
      children: patrols,
    );
  }

  getSignedInUser() async {
    try {
      signedInUser = await _auth.currentUser;
      print(
          'patrols screen - user is signed in - email .. ${signedInUser.email} .. uid .. ${signedInUser.uid} .. ');
    } catch (e) {
      print(e);
    }
  }

  // notice this is a duplicate function - best to create a class for it
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
                            print('new patrol');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const NewPatrol()));
                          },
                          child: Center(
                            child: Container(
                              child: Text(
                                'New Patrol',
                                textAlign: TextAlign.right,
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
                child: patrolListView,
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
