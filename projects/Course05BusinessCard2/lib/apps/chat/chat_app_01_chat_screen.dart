import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/apps/chat/chat_app_01_edit_text.dart';
import 'package:flutter_teaching_app/apps/chat/chat_app_01_login.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatApp01ChatScreen extends StatefulWidget {
  ChatApp01ChatScreen({Key? key, required this.loggedInUser2})
      : super(key: key);

  // well what would you know -I don't even need this variable.
  // I can get everything I require
  // from the _auth Firebase instance across the app -
  // very handy indeed !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  final Future<UserCredential> loggedInUser2;

  @override
  State<ChatApp01ChatScreen> createState() => _ChatApp01RegistrationState();
}

class _ChatApp01RegistrationState extends State<ChatApp01ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var textEditingControllerChatText;
  var email = '';
  var password = '';
  var chatText = '';
  var chatTextCumulative = '';
  var chatTextItem = '';
  var chatTextArray = [];
  late var loggedInUser;
  late var loggedInUser2;

  @override
  initState() {
    super.initState();
    print('chat app init state');

    getLoggedInUser();
    getLoggedInUser2(); // passed in from previous screen
    // actually is not required but code retained for sake of completeness
    // and for future use where passing in parameter is required
    getChatMessages();

    setState(() {
      textEditingControllerChatText = TextEditingController(text: chatText);
    });
  }

  getLoggedInUser() async {
    try {
      print('.. trying to get loggedInUser ... waiting ...');
      loggedInUser = await _auth.currentUser;
      print('.. loggedInUser has arrived ...');
      print('user ... ' + loggedInUser.toString());
      print('user uid .. ' + loggedInUser.uid);
      print('user email .. ' + loggedInUser.email);
      print('user created .. ' + loggedInUser.metadata.creationTime.toString());
      print('user last logged in .. ' +
          loggedInUser.metadata.lastSignInTime.toString());
      print('user display name .. ' + loggedInUser.displayName.toString());
    } catch (e) {
      print(e);
    }
  }

  getLoggedInUser2() async {
    try {
      loggedInUser2 = await widget.loggedInUser2;
      print('UserCredential object passed in from login screen ... ' +
          loggedInUser2.toString());
      print('user2 passed in from login screen ... ' +
          loggedInUser2.user.toString());
      print('user2 uid .. ' + loggedInUser2.user.uid);
      print('user2 email .. ' + loggedInUser2.user.email);
      print('user2 created .. ' +
          loggedInUser2.user.metadata.creationTime.toString());
      print('user2 last logged in .. ' +
          loggedInUser2.user.metadata.lastSignInTime.toString());
      print(
          'user2 display name .. ' + loggedInUser2.user.displayName.toString());
    } catch (e) {
      print(e);
    }
  }

  setChatText(String value) {
    setState(() {
      chatText = value;
      print('value of chat text entered - $chatText');
    });
  }

  setChatTextCumulative() {
    _firestore.collection('messages').add({
      'text': chatText,
      'sender': loggedInUser.email,
      'created': Timestamp.now(),
    });

    setState(() {
      chatTextCumulative = chatText + '\n' + chatTextCumulative;
      print('cumulative value of text chat is - $chatTextCumulative');
      chatText = '';
      textEditingControllerChatText = TextEditingController(text: chatText);
    });
  }

  getChatMessages() async {
    print('getting firestore first message id ... waiting ...');
    _firestore
        .collection('messages')
        .orderBy('created', descending: true)
        .get()
        .then((message) => {print(message.docs.first.id)});

    print('getting messages from firestore database ... waiting ...');
    final messages = await _firestore
        .collection('messages')
        .orderBy('created', descending: true)
        .get();
    var messageArray = messages.docs;
    var count = messageArray.length.toString();
    print('the database has $count items');
    messageArray.forEach(
      (element) => print('firebase chat text ${element.id} ${element.data()}'),
    );
    chatTextCumulative = '';

    messageArray.forEach(
      (element) => {
        chatTextItem = element.data()['text'],
        chatTextCumulative += chatTextItem,
        chatTextCumulative += '\n',
        chatTextArray.add(chatTextItem)
      },
    );

    setState(() {
      chatTextCumulative = chatTextCumulative;
      print('cumulative value of text chat is - $chatTextCumulative');
    });

    var chatTextCumulative2 = '';
    messageArray.forEach(
      (element) => {
        chatTextCumulative2 += element.id,
        chatTextCumulative2 += ' - ',
        chatTextCumulative2 += element.data().toString(),
        chatTextCumulative2 += element.data()['text'],
        chatTextCumulative2 += '   ',
      },
    );
    print('cumulative value of data records - $chatTextCumulative2');
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
                                //
                                // title - chat here
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
                                // chat text entered
                                //
                                Expanded(
                                  flex: 3,
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
                                              textAlign: TextAlign.center,
                                              controller:
                                                  textEditingControllerChatText,
                                              onChanged: (value) {
                                                setChatText(value);
                                              },
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                hintText: '',
                                                hintStyle: TextStyle(
                                                  color: kColorLightGrey02,
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
                                // chat output
                                //
                                Expanded(
                                  flex: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('viewing output for text chat');
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatApp01EditText()));
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
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 5.0),
                                          child: Text(chatTextCumulative,
                                              textAlign: TextAlign.center),
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
                                // Send Chat Text
                                //

                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      print('attempting to send chat text');
                                      try {
                                        setChatTextCumulative();
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
                                          child: Text('Send Chat Text'),
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
                                // Sign out
                                //

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
                                  flex: 1,
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
