# documentation

## contents

- [documentation](#documentation)
  - [contents](#contents)
  - [introduction](#introduction)
  - [installation](#installation)
  - [running dartdoc](#running-dartdoc)

## introduction

we can use inline comments to auto-generate docs for our flutter application

## installation

to install the documentation tool run this command

```java
pub global activate dartdoc
// or
flutter pub global activate dartdoc
```

and then

```java
dart pub global activate dartdoc
/*
Building package executables...
Built dartdoc:dartdoc.
Installed executable dartdoc.
Activated dartdoc 4.1.0.
*/
```

## running dartdoc

go to the root of your project and run

```java
dartdoc
/*
Documenting myProject...
Initialized dartdoc with 584 libraries in 123.0 seconds
Generating docs for library main from package:myProject/main.dart...
Validating docs...
no issues found
Documented 1 public library in 3.8 seconds
Success! Docs generated into C:\path\to\project\myProject\doc\api
```



