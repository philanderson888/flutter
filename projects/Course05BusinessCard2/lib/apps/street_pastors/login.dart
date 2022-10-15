import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'patrols.dart';

class StreetPastorsLogin extends StatefulWidget {
  const StreetPastorsLogin({Key? key}) : super(key: key);

  @override
  State<StreetPastorsLogin> createState() => _StreetPastorsLoginState();
}

class _StreetPastorsLoginState extends State<StreetPastorsLogin> {
  final _auth = FirebaseAuth.instance;
  late TextEditingController textEditingControllerEmail;
  late TextEditingController textEditingControllerPassword;
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

  signIn() {
    print('sign in');
    print('attempting to sign in user with email $email password $password');
    try {
      loggedInUser =
          _auth.signInWithEmailAndPassword(email: email, password: password);
      if (loggedInUser != null) {
        print('signed in - loggedInUser = ');
        print(loggedInUser);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Patrols()));
      }
    } catch (e) {
      print('sign in failed with error message $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: kColorLightGrey002,
              ),
            ),
            //
            // header
            //
            Expanded(
              flex: 5,
              child: Container(
                color: kColorLightGrey003,
                child: Center(
                  child: Text(
                    'Login',
                    style: kTextStyle30,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: kColorLightGrey002,
              ),
            ),
            //
            // email
            //
            Expanded(
              flex: 5,
              child: Container(
                color: kColorLightGrey003,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  controller: textEditingControllerEmail,
                  onChanged: (value) {
                    setEmail(value);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: kColorLightGrey002,
              ),
            ),
            //
            // password
            //
            Expanded(
              flex: 5,
              child: Container(
                color: kColorLightGrey003,
                child: TextField(
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
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: kColorLightGrey002,
              ),
            ),
            //
            // login button
            //
            Expanded(
              flex: 5,
              child: Container(
                color: kColorLightGrey004,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: kColorLightGrey003,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: kColorLightGrey004,
                        child: GestureDetector(
                          onTap: () {
                            signIn();
                          },
                          child: Center(
                            child: Text('Login', style: kTextStyle20),
                          ),
                        ),
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
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: kColorLightGrey002,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
