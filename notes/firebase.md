# firebase

## contents

- [firebase](#firebase)
  - [contents](#contents)
  - [getting started](#getting-started)
  - [create new firebase project](#create-new-firebase-project)
  - [add firebase to android app](#add-firebase-to-android-app)
  - [install Flutter CLI](#install-flutter-cli)
  - [commands to use](#commands-to-use)
  - [initialise the app to use Firebase](#initialise-the-app-to-use-firebase)
  - [add libraries](#add-libraries)
  - [register user](#register-user)
  - [add cloud firestore](#add-cloud-firestore)

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

## commands to use 

```java
flutterfire configure 
firebase 
```

## initialise the app to use Firebase

```java
// add this library
import 'firebase_options.dart';

// amend this code 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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