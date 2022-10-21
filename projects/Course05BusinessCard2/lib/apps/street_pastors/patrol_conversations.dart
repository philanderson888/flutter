import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_teaching_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/patrol.dart';

class PatrolConversations extends StatefulWidget {
  const PatrolConversations({Key? key, required this.patrol}) : super(key: key);

  final Patrol patrol;

  @override
  State<PatrolConversations> createState() => _PatrolConversationsState();
}

class _PatrolConversationsState extends State<PatrolConversations> {
  final GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  late var loggedInUser;
  late String userId;
  late Patrol patrol;
  late String patrolId;
  late List<String> conversations;

  var contactName = '';
  var conversationNotes = '';
  late TextEditingController textEditingControllerContactName;
  late TextEditingController textEditingControllerConversationNotes;

  @override
  initState() {
    print(
        '\n\nPatrol Conversations Page\n===========================================');
    super.initState();
    getLoggedInUser();
    patrol = widget.patrol;
    patrolId = patrol.patrolId;
    conversations = patrol.conversations;
    initializeDateFormatting();
    textEditingControllerContactName = TextEditingController(text: '');
    textEditingControllerConversationNotes = TextEditingController(text: '');
  }

  getLoggedInUser() async {
    try {
      loggedInUser = await _auth.currentUser;
      userId = loggedInUser.uid;
      print(
          'user is logged in - email .. ${loggedInUser.email} .. uid .. $userId .. ');
    } catch (e) {
      print(e);
    }
  }

  //
  // navigation
  //

  //
  // not used
  //

  /*
      List<PatrolConversation> conversationsList = [];
      for (var conversation in conversations) {
        var conversationClass = PatrolConversation(
            name2: conversation['name'], notes2: conversation['notes']);
        conversationsList.add(conversationClass);
        print(
            'conversation name ${conversationClass.name} notes ${conversationClass.notes}');
      }
       */

  setConversationName(String value) {
    final loForm = _oFormKey.currentState;
    if (loForm?.validate() == true) {
      loForm?.save();
      setState(() {
        contactName = value;
        print('Contact name is $contactName');
      });
    }
  }

  setConversationNotes(String value) {
    setState(() {
      conversationNotes = value;
      print('Conversation notes $conversationNotes');
    });
  }

  goToConversations() {
    print('going to conversations screen');
  }

  submitContact() async {
    try {
      final patrolToUpdate = {'no': 'data'};
      _firestore
          .collection('patrols')
          .doc(patrolId)
          .set(patrolToUpdate, SetOptions(merge: true));
      print(
          'user ${loggedInUser.email} patrol conversations updated in firebase');
      print('name $contactName notes $conversationNotes');
    } catch (e) {
      print(e);
    }
  }

  submitConversation() async {
    try {
      var conversation = '$contactName::::$conversationNotes';
      conversations.add(conversation);
      final patrolToUpdate = {
        'conversations': conversations,
      };
      _firestore
          .collection('patrols')
          .doc(patrolId)
          .set(patrolToUpdate, SetOptions(merge: true));
      print('conversation updated in firebase name $conversation}');
      setState(() {
        contactName = '';
        conversationNotes = '';
        textEditingControllerContactName = TextEditingController(text: '');
        textEditingControllerConversationNotes =
            TextEditingController(text: '');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _oFormKey,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(color: kColorLightGrey001),
              ),
              //
              // heading
              //
              Expanded(
                flex: 1,
                child: Container(
                  color: kColorLightGrey002,
                  child: Center(
                    child: Text('Conversations', style: kTextStyle20Bold),
                  ),
                ),
              ),
              //
              // main data form
              //
              Expanded(
                flex: 20,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: kColorLightGrey003,
                      ),
                    ),
                    //
                    // form
                    //
                    Expanded(
                      flex: 18,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey002,
                              child: const Center(child: Text('')),
                            ),
                          ),

                          //
                          // contact name
                          //
                          Expanded(
                            flex: 2,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: textEditingControllerContactName,
                              onChanged: (value) {
                                setConversationName(value);
                              },
                              enableSuggestions: true,
                              autocorrect: true,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'contact name',
                                  hintStyle:
                                      TextStyle(color: kColorLightGrey02)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey002,
                              child: const Center(child: Text('')),
                            ),
                          ),

                          //
                          // conversation notes
                          //
                          Expanded(
                            flex: 11,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller:
                                  textEditingControllerConversationNotes,
                              onChanged: (value) {
                                setConversationNotes(value);
                              },
                              enableSuggestions: true,
                              autocorrect: true,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'conversation notes',
                                  hintStyle:
                                      TextStyle(color: kColorLightGrey02)),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey002,
                              child: Container(),
                            ),
                          ),

                          //
                          // submit conversation
                          //

                          Expanded(
                            flex: 2,
                            child: Container(
                              color: kColorLightGrey001,
                              child: GestureDetector(
                                onTap: () {
                                  submitConversation();
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: kColorLightGrey002,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        color: kColorLightGrey003,
                                        child: Center(
                                            child: Text(
                                          'Submit Conversation',
                                          textAlign: TextAlign.center,
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: kColorLightGrey002,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              color: kColorLightGrey004,
                            ),
                          ),
                        ],
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
              //
              // submit
              //
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(color: kColorLightGrey003),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: kColorLightGrey004,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Contact Matrix'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(color: kColorLightGrey003),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: kColorLightGrey004,
                        child: ElevatedButton(
                          onPressed: () {
                            goToConversations();
                          },
                          child: const Text('Conversations'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(color: kColorLightGrey003),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(color: kColorLightGrey001),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
