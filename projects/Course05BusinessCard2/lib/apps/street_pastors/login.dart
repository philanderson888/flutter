import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StreetPastorsLogin extends StatefulWidget {
  const StreetPastorsLogin({Key? key}) : super(key: key);

  @override
  State<StreetPastorsLogin> createState() => _StreetPastorsLoginState();
}

class _StreetPastorsLoginState extends State<StreetPastorsLogin> {
  final _auth = FirebaseAuth.instance;
  var textEditingControllerEmail;
  var textEditingControllerPassword;
  var email = '123@abc.com';
  var password = 'verySecure123';
  late var loggedInUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Text('Register'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print('signing in');
                },
                child: Container(
                  child: Center(
                    child: Text('Sign In'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print('register');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StreetPastorsRegister()));
                },
                child: Container(
                  child: Center(
                    child: Text('Register'),
                  ),
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
