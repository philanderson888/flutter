# commands

## contents

- [commands](#commands)
  - [contents](#contents)
  - [flutter doctor](#flutter-doctor)
  - [flutter upgrade](#flutter-upgrade)
  - [flutter create - samples](#flutter-create---samples)
  - [analyze](#analyze)
  - [flutter pub get](#flutter-pub-get)
  - [flutter pub upgrade](#flutter-pub-upgrade)
  - [vscode shortcuts](#vscode-shortcuts)
  - [clean](#clean)
  - [build](#build)
  - [install](#install)
  - [run](#run)
  - [shortcut commands](#shortcut-commands)


## flutter doctor

checks for errors in your install

```java
flutter doctor
```

## flutter upgrade

```java
flutter upgrade
```



## flutter create - samples

if you want to investigate `flutter create` samples you can do so by running the command below and then inspecting `flutter-samples.json`

```bash
flutter create --list-samples=flutter-samples.json
```

## analyze

analyze your app for problems

```java
flutter analyze
```


## flutter pub get

```java
// get all packages mentioned in pubspec.yaml but not downloaded yet
flutter pub get
// this is the same as
flutter packages get
```

## flutter pub upgrade

upgrade to latest version of all libraries in use

```java
// upgrade all packages to latest
flutter pub upgrade
// show outdated packages
flutter pub outdated
```

## vscode shortcuts

```java
// type
st
/* brings up options
- stateful widget 
- stateless widget
*/
```

## clean

remove any builds

```java
flutter clean
```

## build

build apk at `build/apps/output/apk/`

```java
flutter build apk
```

## install

```java
flutter install
```


## run

firstly view all potential devices that can be run on

```java
// view devices
flutter devices
```

then run on chosen device

```java
// web
flutter run -d Chrome --web-renderer html
// android
flutter run -d 'SM T813'
// release
flutter run --release
```

## shortcut commands

```java
- stless
  - new stateless widget
- stful 
  - new stateful widget
- control-q
  - quick docs
```