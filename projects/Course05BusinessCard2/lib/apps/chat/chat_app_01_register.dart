import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ChatApp01Registration extends StatefulWidget {
  const ChatApp01Registration({Key? key}) : super(key: key);

  @override
  State<ChatApp01Registration> createState() => _ChatApp01RegistrationState();
}

class _ChatApp01RegistrationState extends State<ChatApp01Registration> {
  var textEditingControllerEmail;
  var textEditingControllerPassword;
  var email = '123@abc.com';
  var password = 'verySecure123';

  @override
  initState() {
    super.initState();
    print('chat app init state');

    setState(() {
      textEditingControllerEmail = TextEditingController(text: email);
      textEditingControllerPassword = TextEditingController(text: password);
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
                                child: Text('Chat App Registration Screen'),
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
                                // title - please register
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
                                        flex: 1,
                                        child: Center(
                                          child:
                                              Text('Please Register Here ...'),
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
                                  flex: 1,
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
                                              controller:
                                                  textEditingControllerEmail,
                                              onChanged: (value) {
                                                print(
                                                    'new email entered $value');
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
                                  flex: 1,
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
                                              controller:
                                                  textEditingControllerPassword,
                                              onChanged: (value) {
                                                print(
                                                    'new password entered $value');
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
                                    onTap: () {
                                      print(
                                          'attempting to register a new user with email $email password $password');
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ChatApp01Registration()));
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
                                          child: Text('Register'),
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
