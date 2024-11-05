# 2024-11 flutter notes

## contents

- [2024-11 flutter notes](#2024-11-flutter-notes)
  - [contents](#contents)
  - [geolocation](#geolocation)
    - [introduction](#introduction)
    - [installing](#installing)
    - [permissions](#permissions)

## geolocation

### introduction

geolocation is just one of many features which users love and use for many apps.  It can provide users and apps the ability to know where the user is and provide useful services at that location

### installing

install using

https://pub.dev/packages/geolocator/install

```bash
flutter pub add geolocator
flutter pub get
```

which puts this into `pubspec.yaml`

```yml
  geolocator: ^11.1.0
```

and we add the library using

```java
import 'package:geolocator/geolocator.dart';
```

### permissions

to add permissions we need to adjust the `AndroidManifest.xml` as follows

```java
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <application
        ...
```
