import 'package:flutter/material.dart';
import './chat_app_01_register.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'chat_app_01_login.dart';

class ChatApp01 extends StatefulWidget {
  const ChatApp01({Key? key}) : super(key: key);

  @override
  State<ChatApp01> createState() => _ChatApp01State();
}

class _ChatApp01State extends State<ChatApp01> {
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
                  child: const Center(child: Text('😎    Chat App'))),
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
                                shape: kRoundedRectangleBorder30,
                              ),
                              child: const Center(
                                child: Text('Chat App'),
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
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                      const Expanded(
                                        flex: 5,
                                        child: Center(
                                          child: Text(
                                              'Welcome to my beautuiful chat app ...'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(
                                          'attempting to register a new user');
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
                                          shape: kRoundedRectangleBorder30,
                                        ),
                                        child: const Center(
                                          child: Text('Register'),
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
                                      print('going to login screen');
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ChatApp01Login()));
                                    },
                                    child: Container(
                                      color: kSuperLightSkyBlue,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: ShapeDecoration(
                                          color: kLightSkyBlue,
                                          shape: kRoundedRectangleBorder30,
                                        ),
                                        child: const Center(
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
