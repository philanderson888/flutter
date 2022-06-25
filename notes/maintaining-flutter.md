# maintaining flutter

## contents

- [maintaining flutter](#maintaining-flutter)
  - [contents](#contents)
  - [introduction](#introduction)
  - [reference](#reference)
  - [upgrading the flutter sdk](#upgrading-the-flutter-sdk)
  - [upgrade packages](#upgrade-packages)
  - [join beta channel](#join-beta-channel)
  - [gradle](#gradle)
    - [upgrading gradle](#upgrading-gradle)

## introduction

over time all versions of many libraries and dependencies change, including the flutter sdk itself. so these tasks will have to be done as part of routine maintenance

## reference

- https://docs.flutter.dev/development/tools/sdk/upgrading
  
## upgrading the flutter sdk

check all OK before you begin - no issues

```java
flutter doctor
/*
PS C:\github\flutter> flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 2.10.4, on Microsoft Windows [Version 10.0.19043.1766], locale en-GB)
[√] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
[√] Chrome - develop for the web
[√] Visual Studio - develop for Windows (Visual Studio Build Tools 2019 16.11.9)
[√] Android Studio (version 2021.2)
[√] Android Studio (version 2021.1)
[√] IntelliJ IDEA Community Edition (version 2021.2)
[√] VS Code, 64-bit edition (version 1.68.1)
[√] Connected device (4 available)
[√] HTTP Host Availability
• No issues found!
*/
```

now run the upgrade

```java
flutter upgrade
/*
PS C:\github\flutter> flutter upgrade
Upgrading Flutter to 3.0.3 from 2.10.4 in c:\Users\phila\flutter...
Checking Dart SDK version...
Downloading Dart SDK from Flutter engine ffe7b86a1e5b5cb63c8385ae1adc759e372ee8f4...
Expanding downloaded archive...
Building flutter tool...
Running pub upgrade...
Upgrading engine...
Downloading Material fonts...                                      639ms
Downloading android-arm-profile/windows-x64 tools...               172ms

Flutter 3.0.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 676cefaaff (3 days ago) • 2022-06-22 11:34:49 -0700
Engine • revision ffe7b86a1e
Tools • Dart 2.17.5 • DevTools 2.12.2

Running flutter doctor...
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 3.0.3, on Microsoft Windows [Version 10.0.19043.1766], locale en-GB)
[√] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
[√] Chrome - develop for the web
[√] Visual Studio - develop for Windows (Visual Studio Build Tools 2019 16.11.9)
[√] Android Studio (version 2021.2)
[√] Android Studio (version 2021.1)
[√] IntelliJ IDEA Community Edition (version 2021.2)
[√] VS Code, 64-bit edition (version 1.68.1)
[√] Connected device (4 available)
[√] HTTP Host Availability

• No issues found!
*/
```

## upgrade packages

```java
cd .. /path/to/project/root
flutter pub upgrade
// check for outdated packages which cannot be updated
flutter pub outdated
```

## join beta channel

to get the latest you can join the beta channel

```java
// query
flutter channel
/*
Flutter channels:
  master
  beta
* stable
*/
// set to receive beta channel updates
flutter channel beta
// download beta updates
flutter upgrade
```

## gradle

gradle is a build tool which is used to help maintain the correct relationship between the versions of

- java
- android studio
- android sdk
- ... and other libraries 

### upgrading gradle

android studio will prompt to upgrade, just follow the prompts .. 

```java
// Upgrade Android Gradle Plugin From version 4.1.0 to 7.2.0
```



