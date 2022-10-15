import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/apps/chat/chat_app_01_login.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatApp01EditText extends StatefulWidget {
  const ChatApp01EditText({Key? key}) : super(key: key);

  @override
  State<ChatApp01EditText> createState() => _ChatApp01RegistrationState();
}

class _ChatApp01RegistrationState extends State<ChatApp01EditText> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var email = '';
  var password = '';
  var chatText = '';
  var chatTextCumulative = '';
  var chatTextItem = '';
  var chatTextArray = [];
  var spinnerMax = 1;
  var chatTextId = '';
  var chatTextDatabaseIds = [];
  var chatTextIndex = 0;

  late TextEditingController textEditingControllerChatText;
  late var loggedInUser;
  late var loggedInUser2;

  @override
  initState() {
    super.initState();
    print('chat app init state');

    getLoggedInUser();
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
      print('user2 passed in from login screen ... ' + loggedInUser.toString());
      print('user2 uid .. ' + loggedInUser.uid);
      print('user2 email .. ' + loggedInUser.email);
      print(
          'user2 created .. ' + loggedInUser.metadata.creationTime.toString());
      print('user2 last logged in .. ' +
          loggedInUser.metadata.lastSignInTime.toString());
      print('user2 display name .. ' + loggedInUser.displayName.toString());
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
      chatTextCumulative += chatText + '\n';
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
        chatTextId = element.id,
        if (chatTextItem.isNotEmpty)
          {
            chatTextCumulative += chatTextItem,
            chatTextCumulative += '\n',
            chatTextArray.add(chatTextItem),
            // temporary solution before I build a proper class to deal with database object
            chatTextDatabaseIds.add(chatTextId)
          }
      },
    );

    setState(() {
      chatTextCumulative = chatTextCumulative;
      chatText = messageArray[0].data()['text'];
      print('chat text value of single item isolated for editing is $chatText');
      textEditingControllerChatText = TextEditingController(text: chatText);
      print('cumulative value of text chat is - $chatTextCumulative');
      spinnerMax = chatTextArray.length;
    });

    var chatTextCumulative2 = '';
    messageArray.forEach(
      (element) => {
        chatTextCumulative2 += element.id,
        chatTextCumulative2 += ' - ',
        chatTextCumulative2 += element.data().toString(),
        chatTextItem = element.data()['text'],
        chatTextCumulative2 += chatTextItem,
        chatTextCumulative2 += '   ',
      },
    );
    print('cumulative value of data records - $chatTextCumulative2');
  }

  incrementTextChatIndex(double index) {
    chatTextIndex = index.toInt();

    setState(() {
      if (chatTextIndex <= chatTextArray.length) {
        chatText = chatTextArray[chatTextIndex];
        chatTextId = chatTextDatabaseIds[chatTextIndex];
        textEditingControllerChatText = TextEditingController(text: chatText);
        print(
            'setting new chosen chat line index as $chatTextIndex with id $chatTextId');
      }
    });
  }

  updateChatText() {
    print(
        'attempting to update chat text for line $chatTextIndex id $chatTextId with new data $chatText');
    chatTextArray[chatTextIndex] = chatText;
    chatTextCumulative = '';
    chatTextArray.forEach((item) {
      chatTextCumulative += item + '\n';
    });
    final mergeData = {'text': chatText};
    _firestore
        .collection('messages')
        .doc(chatTextId)
        .set(mergeData, SetOptions(merge: true))
        .onError((error, _) => print('Error $error'));

    setState(() {
      chatTextCumulative = chatTextCumulative;
    });
  }

  deleteChatText() {
    print(
        'attempting to delete chat line $chatTextIndex with id $chatTextId from database');
    _firestore.collection('messages').doc(chatTextId).delete().then(
          (item) => print('Document delete'),
          onError: (e) => print('Error deleting document'),
        );
    chatTextArray.removeAt(chatTextIndex);
    chatTextDatabaseIds.removeAt(chatTextIndex);
    chatTextCumulative = '';
    chatTextArray.forEach((item) {
      chatTextCumulative += item + '\n';
    });

    setState(() {
      chatTextCumulative = chatTextCumulative;
    });
  }

  getChatStream() async {
    await for (var snapshot in _firestore
        .collection('messages')
        .orderBy('created', descending: true)
        .snapshots()) {
      for (var message in snapshot.docs) {
        print('data streamed from id ${message.id} ${message.data()}');
      }
    }
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
                                shape: RoundedRectangleBorder(
                                  borderRadius: kBorderRadius30,
                                ),
                              ),
                              child: const Center(
                                child: Text('Chat App Edit Screen'),
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
                                        child: const Center(
                                          child: Text('Line To Be Edited ...'),
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
                                // editing chat text
                                //
                                Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('editing chat text');
                                    },
                                    child: Container(
                                      color: kSuperLightSkyBlue,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: ShapeDecoration(
                                          color: kLightSkyBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: kBorderRadius30,
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
                                                border: kOutlineInputBorderNone,
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
                                  flex: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('viewing output for text chat');
                                    },
                                    child: Container(
                                      color: kSuperLightSkyBlue,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: ShapeDecoration(
                                          color: kLightSkyBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: kBorderRadius30,
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

                                //
                                // streaming output
                                //

                                Expanded(
                                  flex: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('viewing streaming chat output');
                                    },
                                    child: Container(
                                      color: kSuperLightSkyBlue,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: ShapeDecoration(
                                          color: kLightSkyBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: kBorderRadius30,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 5.0),
                                          //child: Text(chatTextCumulative, textAlign: TextAlign.center),
                                          child: StreamBuilder<QuerySnapshot>(
                                              stream: _firestore
                                                  .collection('messages')
                                                  .orderBy('created',
                                                      descending: true)
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      backgroundColor:
                                                          kColorLightBlueAccent,
                                                    ),
                                                  );
                                                }
                                                final messages =
                                                    snapshot.data!.docs;
                                                print(
                                                    'messages returned from firestore $messages');
                                                var outputString = '';
                                                for (int i = 0;
                                                    i < messages.length;
                                                    i++) {
                                                  outputString += messages
                                                      .elementAt(i)['text'];
                                                  outputString += '\n';
                                                }
                                                for (var message in messages) {
                                                  final messageText =
                                                      message['text'];
                                                  print('message text ' +
                                                      messageText);
                                                }
                                                return Text(outputString);
                                              }),
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
                                // number spinbox
                                //

                                Expanded(
                                  flex: 2,
                                  child: SpinBox(
                                      min: 1,
                                      max: spinnerMax.toDouble(),
                                      value: 1,
                                      decoration: const InputDecoration(
                                          labelText: 'Basic'),
                                      onChanged: (value) {
                                        incrementTextChatIndex(value - 1);
                                      }),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),

                                //
                                // Update Chat Text
                                //

                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      print('attempting to update chat text');
                                      try {
                                        updateChatText();
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
                                            borderRadius: kBorderRadius30,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text('Update Chat Text'),
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
                                // Get Streaming Chat Text
                                //

                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      print(
                                          'attempting to get streaming chat text');
                                      try {
                                        getChatStream();
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
                                            borderRadius: kBorderRadius30,
                                          ),
                                        ),
                                        child: Center(
                                          child:
                                              Text('Get Streaming Chat Text'),
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
                                // Delete Chat Text
                                //

                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      try {
                                        deleteChatText();
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
                                            borderRadius: kBorderRadius30,
                                          ),
                                        ),
                                        child: Center(
                                          child: const Text('Delete Chat Text'),
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
                                                    const ChatApp01Login()));
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
                                            borderRadius: kBorderRadius30,
                                          ),
                                        ),
                                        child: const Center(
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
