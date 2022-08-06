# firebase

## contents

- [firebase](#firebase)
  - [contents](#contents)
  - [getting started](#getting-started)
    - [create new firebase project](#create-new-firebase-project)
    - [add firebase to android app](#add-firebase-to-android-app)

## getting started

### create new firebase project

create a new firebase project at 

https://console.firebase.google.com 

such as 

https://console.firebase.google.com/project/flutter-chat-app-26948/overview

### add firebase to android app 

firstly have to find your `applicationId` which is found in `/android/app/build.gradle` file under the `defaultConfig{} section and in my case it is 

```java
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "co.philanderson.flutter_app"
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
```
