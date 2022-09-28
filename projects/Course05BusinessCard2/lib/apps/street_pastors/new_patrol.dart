import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Patrols extends StatefulWidget {
  const Patrols({Key? key}) : super(key: key);

  @override
  State<Patrols> createState() => _PatrolsState();
}

class _PatrolsState extends State<Patrols> {
  final _auth = FirebaseAuth.instance;
  var textEditingControllerEmail;
  var textEditingControllerPassword;
  var email = '123@abc.com';
  var password = 'verySecure123';
  late var loggedInUser;

  @override
  initState() {
    super.initState();
    print('street pastors patrols');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
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
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Text('Patrols'),
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
    );
  }
}
