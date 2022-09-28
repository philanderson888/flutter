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
  initState() {
    super.initState();
    print('street pastors login - initState()');
    setState(() {
      textEditingControllerEmail = TextEditingController(text: email);
      textEditingControllerPassword = TextEditingController(text: password);
    });
  }

  setEmail(String value) {
    setState(() {
      email = value;
    });
  }

  setPassword(String value) {
    setState(() {
      password = value;
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
                child: Center(
                  child: Text('Login'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                controller: textEditingControllerEmail,
                onChanged: (value) {
                  setEmail(value);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                controller: textEditingControllerPassword,
                onChanged: (value) {
                  setPassword(value);
                },
                obscureText: true,
                obscuringCharacter: '*',
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print('login');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StreetPastorsListPatrols()));
                },
                child: Container(
                  child: Center(
                    child: Text('Login'),
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
