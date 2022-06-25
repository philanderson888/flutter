# geolocation

## contents

- [geolocation](#geolocation)
  - [contents](#contents)
  - [introduction](#introduction)
  - [installing](#installing)
  - [library](#library)

## introduction

geolocation is just one of many features which users love and use for many apps.  It can provide users and apps the ability to know where the user is and provide useful services at that location

## installing

to add permissions we need to adjust the `AndroidManifest.xml` as follows

```java
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

## library

we can use the flutter library

- https://pub.dev/packages/geolocator/install

