# firebase

## contents

- [firebase](#firebase)
  - [contents](#contents)
  - [getting started](#getting-started)
  - [create new firebase project](#create-new-firebase-project)
  - [add firebase to android app](#add-firebase-to-android-app)
  - [add libraries](#add-libraries)
  - [add authentication](#add-authentication)
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

## add libraries

we can add plugins from https://firebase.google.com/docs/flutter/setup?platform=ios#available-plugins

all packages depend on this one so this must be done first ...

```java
// install
flutter pub add firebase_core
flutter pub add firebase_auth 
flutter pub add cloud_firestore
// use
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
```

## add authentication


## add cloud firestore