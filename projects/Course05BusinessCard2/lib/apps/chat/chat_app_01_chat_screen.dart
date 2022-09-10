import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/apps/chat/chat_app_01_login.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatApp01ChatScreen extends StatefulWidget {
  ChatApp01ChatScreen({Key? key, required this.loggedInUser}) : super(key: key);

  // well what would you know -I don't even need this variable.
  // I can get everything I require
  // from the _auth Firebase instance across the app -
  // very handy indeed !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  final Future<UserCredential> loggedInUser;

  @override
  State<ChatApp01ChatScreen> createState() => _ChatApp01RegistrationState();
}

class _ChatApp01RegistrationState extends State<ChatApp01ChatScreen> {
  final _auth = FirebaseAuth.instance;
  var textEditingControllerEmail;
  var textEditingControllerPassword;
  var email = '';
  var password = '';
  late var loggedInUser;
  late var loggedInUser2;

  @override
  initState() {
    super.initState();
    print('chat app init state');

    getLoggedInUser();
    getLoggedInUser2();

    setState(() {
      textEditingControllerEmail = TextEditingController(text: email);
      textEditingControllerPassword = TextEditingController(text: password);
    });
  }

  getLoggedInUser() async {
    try {
      loggedInUser = await widget.loggedInUser;
      print('UserCredential object passed in from login screen ... ' +
          loggedInUser.toString());
      print('user passed in from login screen ... ' +
          loggedInUser.user.toString());
      print('user uid .. ' + loggedInUser.user.uid);
      print('user email .. ' + loggedInUser.user.email);
      print('user created .. ' +
          loggedInUser.user.metadata.creationTime.toString());
      print('user last logged in .. ' +
          loggedInUser.user.metadata.lastSignInTime.toString());
      print('user display name .. ' + loggedInUser.user.displayName.toString());
    } catch (e) {
      print(e);
    }
  }

  getLoggedInUser2() async {
    try {
      print('.. trying to get loggedInUser2 ... waiting ...');
      loggedInUser2 = await _auth.currentUser;
      print('.. loggedInUser2 has arrived ...');
      print(
          'user2 passed in from login screen ... ' + loggedInUser2.toString());
      print('user2 uid .. ' + loggedInUser2.uid);
      print('user2 email .. ' + loggedInUser2.email);
      print(
          'user2 created .. ' + loggedInUser2.metadata.creationTime.toString());
      print('user2 last logged in .. ' +
          loggedInUser2.metadata.lastSignInTime.toString());
      print('user2 display name .. ' + loggedInUser2.displayName.toString());
    } catch (e) {
      print(e);
    }
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
                                child: Text('Chat App Chat Screen'),
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
                                          child: Text('Chat Here ...'),
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
                                      print('adding text to chat app');
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
                                                hintText: '',
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
                                      print('entering text for chat app');
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
                                                hintText: '',
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
                                      print('attempting to log user out');
                                      try {
                                        loggedInUser = _auth.signOut();
                                        print(loggedInUser);

                                        print(
                                            'user successfully signed out ...');

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatApp01Login()));
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
                                          child: Text('Sign Out'),
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
