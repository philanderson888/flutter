import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chat_app_01_chat_screen.dart';

class ChatApp01Login extends StatefulWidget {
  const ChatApp01Login({Key? key}) : super(key: key);

  @override
  State<ChatApp01Login> createState() => _ChatApp01RegistrationState();
}

class _ChatApp01RegistrationState extends State<ChatApp01Login> {
  final _auth = FirebaseAuth.instance;
  var textEditingControllerEmail;
  var textEditingControllerPassword;
  var email = '123@abc.com';
  var password = 'verySecure123';
  late var loggedInUser;

  @override
  initState() {
    super.initState();
    print('chat app init state');

    setState(() {
      textEditingControllerEmail = TextEditingController(text: email);
      textEditingControllerPassword = TextEditingController(text: password);
    });
  }

  setEmail(String value) {
    setState(() {
      email = value;
      print('value of email updated - $email');
    });
  }

  setPassword(String value) {
    setState(() {
      password = value;
      print('value of password updated - $password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSkyBlue,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  color: kLightSkyBlue,
                  child: Center(child: Text('😎    Chat App'))),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(color: kSuperLightSkyBlue),
                  ),
                  Expanded(
                    flex: 20,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(color: kSuperLightSkyBlue),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: kSuperLightSkyBlue,
                            child: Container(
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                color: kLightSkyBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text('Chat App Login Screen'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 40,
                          child: Container(
                            color: kSuperLightSkyBlue,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(),
                                ),
                                //
                                // title - please login
                                //
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text('Please Login Here ...'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                ),

                                //
                                // username - email
                                //
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('entering username');
                                    },
                                    child: Container(
                                      color: kSuperLightSkyBlue,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: ShapeDecoration(
                                          color: kLightSkyBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textAlign: TextAlign.center,
                                              controller:
                                                  textEditingControllerEmail,
                                              onChanged: (value) {
                                                setEmail(value);
                                              },
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                hintText:
                                                    'please enter your email address',
                                                hintStyle: TextStyle(
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                //
                                // password text field
                                //
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('entering password');
                                    },
                                    child: Container(
                                      color: kSuperLightSkyBlue,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: ShapeDecoration(
                                          color: kLightSkyBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              controller:
                                                  textEditingControllerPassword,
                                              onChanged: (value) {
                                                setPassword(value);
                                              },
                                              obscureText: true,
                                              obscuringCharacter: '*',
                                              enableSuggestions: false,
                                              autocorrect: false,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                hintText:
                                                    'please enter your password',
                                                hintStyle: TextStyle(
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      print(
                                          'attempting to login a user with email $email password $password');
                                      try {
                                        loggedInUser =
                                            _auth.signInWithEmailAndPassword(
                                                email: email,
                                                password: password);
                                        print(
                                            'loggedInUser is dynamic and has type ' +
                                                loggedInUser.runtimeType
                                                    .toString());
                                        if (loggedInUser != null) {
                                          print('signing in successfully !!!');
                                          print(loggedInUser);
                                        }
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatApp01ChatScreen(
                                                        loggedInUser:
                                                            loggedInUser)));
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Container(
                                      color: kSuperLightSkyBlue,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: ShapeDecoration(
                                          color: kLightSkyBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text('Login'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 3,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: kSuperLightSkyBlue),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(color: kLightSkyBlue),
            ),
          ],
        ),
      ),
    );
  }
}
