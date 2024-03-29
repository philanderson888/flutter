# firebase

## contents

- [firebase](#firebase)
  - [contents](#contents)
  - [getting started](#getting-started)
  - [create new firebase project](#create-new-firebase-project)
  - [add firebase to android app](#add-firebase-to-android-app)
  - [install Flutter CLI](#install-flutter-cli)
  - [commands to use](#commands-to-use)
  - [2023 update](#2023-update)
  - [initialise the app to use Firebase](#initialise-the-app-to-use-firebase)
  - [add libraries](#add-libraries)
  - [register user](#register-user)
  - [add cloud firestore](#add-cloud-firestore)
  - [add records](#add-records)
  - [read records](#read-records)
  - [update](#update)
  - [delete](#delete)
  - [update for MAC](#update-for-mac)
  - [install flutter CLI](#install-flutter-cli-1)
  - [log in to firebase](#log-in-to-firebase)
  - [initiate firebase for your projects](#initiate-firebase-for-your-projects)
  - [install private files](#install-private-files)

## getting started

## create new firebase project

create a new firebase project at 

https://console.firebase.google.com 

such as 

https://console.firebase.google.com/project/flutter-chat-app-26948/overview

## add firebase to android app 

firstly have to find your `applicationId` which is found in `/android/app/build.gradle` file under the `defaultConfig{} section and in my case it is 

```java
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "co.philanderson.chat_app"
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
```

Then click on the Android icon in `console.developer.google.com` in your project, and add this in as the `application id` and click to register the app

download the `google-services.json` file and put this in the `android\app` folder

add the lines on the next page https://console.firebase.google.com/project/flutter-chat-app-26948/overview to your code base

*Hack: I was forced to increase the minimum sdk version to 19 and was not sure the best way to go about this so did it manually

```java
minSdkVersion 19
```

## install Flutter CLI 

```java
// from root of project
npm install -g firebase-tools
dart pub global activate flutterfire_cli
// add to path the folder flagged during the above command
C:\Users\phila\AppData\Local\Pub\Cache\bin
// from root of project
firebase login --reauth
flutterfire configure
// Firebase configuration file lib\firebase_options.dart generated successfully with the following Firebase apps:
// Platform  Firebase App Id
// web       1:702377681303:web:47135cab502788eed0a4d2
// android   1:702377681303:android:8f9cc9df10f41b92d0a4d2
```

## install flutter CLI on MAC

```bash
curl -sL https://firebase.tools | bash
curl -sL firebase.tools | upgrade=true bash
```


## login to firebase cli

```bash
firebase login
firebase projects:list
firebase init
```

## commands to use 

```java
flutterfire configure 
firebase 
```

## activate flutter fire

just following this to activate flutter fire

https://firebase.google.com/docs/flutter/setup?platform=android
https://firebase.google.com/docs/android/setup

```powershell
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
# Platform  Firebase App Id
# web       1:589695807592:web:a878078901ab2c4cc98bdd
# android   1:589695807592:android:9b2ef5a5f998df0bc98bdd

```


## activate flutter fire mac

```bash
dart pub global activate flutterfire_cli
flutterfire configure
# phil@philips-air street_pastors % flutterfire configure
# i Found 8 Firebase projects. Selecting project streetpastors-4f654.             
# ? Which platforms should your configuration support 
# (use arrow keys & space to s✔ Which platforms should your configuration support (use arrow keys & space to select)? · android, ios, web 
# i Firebase android app uk.co.philanderson.street_pastors registered.            
# i Firebase ios app uk.co.philanderson.streetPastors is not registered on Firebase project streetpastors-4f654.
# i Registered a new Firebase ios app on Firebase project streetpastors-4f654.    
# i Firebase web app street_pastors (web) registered.                             
# ? Generated FirebaseOptions file lib/firebase_options.dart already exists, do yo? Generated FirebaseOptions file lib/firebase_options.dart already exists, do yo✔ Generated FirebaseOptions file lib/firebase_options.dart already exists, do you want to override it? · yes 

# Firebase configuration file lib/firebase_options.dart generated successfully with the following Firebase apps:

# Platform  Firebase App Id
# web       1:589695807592:web:a878078901ab2c4cc98bdd
# android   1:589695807592:android:9b2ef5a5f998df0bc98bdd
# ios       1:589695807592:ios:5f01c8f9e9fff4a0c98bdd
```

## initialise the app to use Firebase

```java
// add this library
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// amend this code 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

## add libraries

we can add plugins from https://firebase.google.com/docs/flutter/setup?platform=ios#available-plugins

all packages depend on this one so this must be done first ...

```java
// install
flutter pub add firebase_core
flutter pub add firebase_auth 
flutter pub add cloud_firestore
// produces in pubspec.yaml
firebase_auth: ^3.6.2
firebase_core: ^1.20.0
cloud_firestore: ^3.4.5
// add libraries to page
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
```

## register user

```java
Class _FirebaseState extends State<Firebase>{
  final _auth = FirebaseAuth.instance;

  // on page 
  child: GestureDetector(
    onTap: () {
      print(
          'attempting to register a new user with email $email password $password');
      
    },
  },
}


```


## add cloud firestore

*Note - the original implementation of firestore was the real time database - which stores JSON*

Cloud Firestore is a NoSQL database which stores data as objects

- go to `console.firebase.google.com` 
- select your app
- choose `firestore database`
- click `create database`
- click `start in test mode`
- choose a location eg `eu-3` for your database

Once the database has been created 
- click 'Start collection' to create a database table
- give the table a name eg `messages`
- add a field `text` of type `string` with value `Hello`
- add a field `sender` of type `string` with value `123@abc.com`
- click on the `auto-id` button to auto-generate an ID for the record
- click to save the record

Now add the database to the app

```java
import 'package:cloud_firestore/cloud_firestore.dart';

// in class
final _firestore = FirebaseFirestore.instance;
```

## add records

```java
// on save - add new record to the database
_firestore.collection('messages').add({
  'text': chatText,
  'sender': loggedInUser2.email,
});
```

## read records

read all records from a collection

*Note that firebase returns data in the form of `QuerySnapshot` which is a snapshot of the database and can be iterated over as a Map<string, dynamic> where string is the `id` and `dynamic is the rest of the data*

```java
final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
var chatText = '';
var chatTextCumulative = '';
var chatTextItem = '';
var chatTextArray = [];

getChatMessages() async {
  print('getting firestore first message id ... waiting ...');
  _firestore
      .collection('messages')
      .get()
      .then((message) => {print(message.docs.first.id)});

  print('getting messages from firestore database ... waiting ...');
  final messages =
      await _firestore.collection('messages').orderBy('created').get();
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
```

## update 

```java
var chatTextCumulative = '';
var chatTextItem = '';
var chatTextArray = [];
var chatTextId = '';
var chatTextDatabaseIds = [];
var chatTextIndex = 0;
n
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
```

## delete

```java
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
```

## update for MAC

to update these steps for MAC please add the following steps

## install flutter CLI

```bash
curl -sL https://firebase.tools | bash
curl -sL https://firebase.tools | upgrade=true bash
```

## log in to firebase

```bash
firebase login
```

## initiate firebase for your projects

```bash
firebase projects:list
```

## install private files

we have certain private files which are not published to github and therefore must be part of your `gitignore` file

please check now that they are indeed part of your `gitignore` file and add them to your project

- android/app/google-services.json
- lib/firebase_options.dart


the app should now compile and run for Android on your MAC

