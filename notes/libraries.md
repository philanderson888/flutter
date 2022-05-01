# libraries

## contents

- [libraries](#libraries)
  - [contents](#contents)
  - [introduction](#introduction)
  - [built-in libraries](#built-in-libraries)
  - [flutter commands](#flutter-commands)
  - [flutter and dart](#flutter-and-dart)

## introduction

libraries in use in our project are shown in the

- `pubspec.yaml` file

and dependencies are locked in the 

- `pubspec.lock` file

to add a new library, search at `https://pub.dev`

then add the library as a dependency in our code as an `import` statement

```java
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
```

then run

`pub.get` or `flutter packages get` command to install the packages.  this places them in the `pubspec.yaml` file and the dependency relationships are locked in the `pubspec.lock` file

we can also add the file directly to our `pubspec.yaml` file and run the same command `pub get` or `flutter packages get` to install them and make them available in our app.

## built-in libraries

some libraries will work automatically without you having to download or specify them other than in your `import` statement in your `.dart` file

for example to use `math.pi` from the `math` library we can code

```java
import 'dart.math' as math;
// inside a function
print('pi has value ' + math.pi.toString());
/*
pi has value 3.141592653589793
*/
```

## flutter commands

```java
// clear existing dependencies
flutter clear
// add entries to `pubspec.yaml` file
flutter pub add ...library_name...
// download packages named in `pubspec.yaml` file
flutter packages get
// or
flutter pub get
// see outdated packages
flutter pub outdated
// upgrade to latest (remove `pubspec.lock` first)
flutter pub upgrade
```



## flutter and dart

it is possible to import libraries in 2 ways into your application

- via flutter
- via dart