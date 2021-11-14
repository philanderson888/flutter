# libraries

## contents

- [libraries](#libraries)
  - [contents](#contents)
  - [introduction](#introduction)
  - [built-in libraries](#built-in-libraries)
  - [flutter commands](#flutter-commands)
  - [import math library](#import-math-library)

## introduction

it is possible to import libraries in 2 ways into your application

- via flutter
- via dart

the equivalent file of `package.json` which hopefully you are familiar with from `javascript` is the file `pubspec.yaml` which is the list of all `public` libraries included in your project.  These libraries are available from the `https://pub.dev/` site.

- pubspec.yaml library dependency file
- pubspec.lock can lock versions to a fixed version so that incompatibility issues do not form

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

## import math library

as an example import the `math` library using

