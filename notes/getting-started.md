# getting started

## table of contents
- [getting started](#getting-started)
  - [table of contents](#table-of-contents)
  - [changelog](#changelog)
  - [getting started with an online ide](#getting-started-with-an-online-ide)
  - [samples](#samples)
  - [references](#references)
  - [install instructions for windows](#install-instructions-for-windows)
  - [install java (not required any more - updated note 2023)](#install-java-not-required-any-more---updated-note-2023)
  - [flutter sdk](#flutter-sdk)
  - [verify install](#verify-install)
  - [visual studio](#visual-studio)
  - [android sdk](#android-sdk)
    - [updating sdk](#updating-sdk)
  - [emulator](#emulator)
  - [install android studio](#install-android-studio)
  - [run a new project to test Android Studio](#run-a-new-project-to-test-android-studio)
  - [run device manager](#run-device-manager)
  - [device manager](#device-manager)
  - [using docker image with android studio](#using-docker-image-with-android-studio)
  - [device manager](#device-manager-1)
    - [configure android studio path](#configure-android-studio-path)
    - [accept android licenses](#accept-android-licenses)
    - [install android studio command line tools](#install-android-studio-command-line-tools)
    - [enabling developer tools on android device](#enabling-developer-tools-on-android-device)
    - [enable google usb driver in android studio](#enable-google-usb-driver-in-android-studio)
  - [Add a device](#add-a-device)
  - [configure android studio for flutter](#configure-android-studio-for-flutter)
  - [install flutter on mac](#install-flutter-on-mac)
    - [install vscode](#install-vscode)
    - [](#)
    - [install xcode](#install-xcode)
    - [install rosetta tools](#install-rosetta-tools)
    - [install flutter sdk](#install-flutter-sdk)
  - [hello world](#hello-world)
    - [build](#build)
    - [run](#run)
  - [remove debug mode](#remove-debug-mode)
  - [building your first project](#building-your-first-project)
    - [pubspec.yaml](#pubspecyaml)
    - [analysis-options.yaml](#analysis-optionsyaml)
    - [hello world](#hello-world-1)
  - [default scaffolding](#default-scaffolding)
  - [app name](#app-name)
  - [app icon](#app-icon)
  - [app images](#app-images)
  - [installing on mac](#installing-on-mac)
    - [download](#download)
    - [add flutter to path](#add-flutter-to-path)
    - [flutter doctor](#flutter-doctor)
    - [cocoapods](#cocoapods)
    - [xcode](#xcode)
    - [simulator](#simulator)
    - [hello world](#hello-world-2)
  - [next steps](#next-steps)

## changelog

- 27/04/2023
  - updated install process
- 08/08/2023
  - added install for MAC

## getting started with an online ide

flutter can be tried out instantly online using flutter's own website at https://flutter.dev/

It can also be used at [Flutter Studio](https://flutterstudio.app)

also `dart` can be run at https://dartpad.dev

## samples

to see examples of samples available online please see

- widgets https://flutter.dev/docs/development/ui/widgets
- material design ui https://material.io/develop/flutter
  - material design colours 
    - https://www.materialpalette.com
    - https://www.materialpalette.com/colors
  - material design icons 
    - https://fonts.google.com/icons
    - https://www.materialpalette.com/icons

## references

please see the following references for further help with regards to installing and getting started with using flutter

- https://www.javatpoint.com/flutter-installation

## install instructions for windows

please see at the bottom for install instructions for mac

the instructions below are for Windows

## install java (not required any more - updated note 2023)

*** updated note 2023 - flutter includes its own version of java sdk and recommends that you use the version bundled with flutter, so no need to separately pre-install java sdk ***

following steps in this youtube video https://www.youtube.com/watch?v=0zx_eFyHRU0

```powershell
# download and install jdk 17
Invoke-WebRequest -Uri https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.msi -OutFile .\JavaJDK.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I JavaJDK.msi /quiet'; rm .\JavaJDK.msi
cd env:
# set environment variable in PATH for c:\program files\java\jdk-17.0.2\bin
$env:PATH = $env:PATH + "C:\Program Files\Java\jdk-17.0.2\bin;"
# set environment variable for JAVA_HOME as C:\Program Files\Java\jdk-17.0.2
 $env:JAVA_HOME = "C:\Program Files\Java\jdk-17.0.2;"
 # open new powershell window
 start-process powershell
 # test install
 javac -version
# java version "17.0.2" 2022-01-18 LTS
# Java(TM) SE Runtime Environment (build 17.0.2+8-LTS-86)
# Java HotSpot(TM) 64-Bit Server VM (build 17.0.2+8-LTS-86, mixed mode, sharing)
javac -version
# javac 17.0.2
# install android studio 
Invoke-WebRequest -Uri https://redirector.gvt1.com/edgedl/android/studio/install/2021.1.1.21/android-studio-2021.1.1.21-windows.exe -OutFile .\AndroidStudio.exe; .\AndroidStudio.exe /S; rm .\AndroidStudio.exe
```

first we must install java and set the environment variables for java.  Note obviously the java version mentioned will have changed, but all other details should be correct, ie replace 17.0.2 with the current version you are downloading

- go to environment variables and remove any PATH items for java or android studio
- install java at c:\program files\java\jdk-17.0.2\   https://www.oracle.com/java/technologies/downloads/#jdk17-windows
- set environment variable in PATH for c:\program files\java\jdk-17.0.2\bin
- set environment variable for JAVA_HOME as C:\Program Files\Java\jdk-17.0.2

```powershell
- close all terminal windows and open a fresh terminal window
- type 'java -version' to view the installed java version to confirm success 
- type 'javac -version' to view java compiler version

```java
java -version
/*
java version "17.0.2" 2022-01-18 LTS
Java(TM) SE Runtime Environment (build 17.0.2+8-LTS-86)
Java HotSpot(TM) 64-Bit Server VM (build 17.0.2+8-LTS-86, mixed mode, sharing)
*/
javac -version
/*
javac 17.0.2
*/
```


## flutter sdk

unzip to eg `c:\sdk\flutter` and add to path eg `c:\sdk\flutter\bin`

restart windows and run the commands

```powershell
cd $env:
ls
echo $env:PATH
$env:PATH = $env:PATH + "c:\flutter\bin;"
restart-computer
# after restart
flutter
flutter doctor
dart
# show install locations on mac
where flutter dart
# show install locations on windows
where.exe flutter dart
/*
c:\sdk\flutter\bin\flutter
c:\sdk\flutter\bin\flutter.bat
c:\sdk\flutter\bin\dart
c:\sdk\flutter\bin\dart.bat
*/
```

next run this command 

```bash
flutter doctor
```

This should identify which programs need to be installed for the full flutter experience to work properly.

```bash
PS C:\github> flutter doctor
Running "flutter pub get" in flutter_tools...                      10.8s
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 2.2.3, on Microsoft Windows [Version 10.0.19043.1165], locale en-GB)
[!] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
    X cmdline-tools component is missing
      Run `path/to/sdkmanager --install "cmdline-tools;latest"`
      See https://developer.android.com/studio/command-line for more details.
    X Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/docs/get-started/install/windows#android-setup for more details.
[√] Chrome - develop for the web
[!] Android Studio (not installed)
[√] IntelliJ IDEA Community Edition (version 2020.2)
[√] VS Code, 64-bit edition (version 1.58.2)
[√] Connected device (2 available)
```

to install the command line tools go to `Android Studio => Tools => SDK Manager => Tools tab` and tick `Command Line Tools`

## verify install

check the install has worked by running

```bash
flutter doctor
```



## visual studio

flutter doctor should highlight that `visual studio` should be installed - please go ahead and download and install it from https://visualstudio.microsoft.com/downloads

## android sdk

download and unzip this to eg c:\sdk\android\sdk and add to path


### updating sdk

may have to remove the

```
/.temp/
/emulator/emulator.installer/ folders
```

before the update can continue, particularly to the emulator.  and also just make sure the emulator is not running.


## emulator

```js
C:\Users\phila\AppData\Local\Android\Sdk\emulator> 
./emulator.exe -list-avds
/*
4_WVGA_Nexus_S_API_22
Pixel_3_API_27
Pixel_3_API_27_2
*/
./emulator.exe -avd 4_WVGA_Nexus_S_API_22
```

 

## install android studio

install android studio from https://developer.android.com/studio 

Android Studio will install at `C:\Program Files\Android\Android Studio` and the binary at`C:\Program Files\Android\Android Studio\bin`

run Android studio and install any dependencies

## run a new project to test Android Studio

```
New Project
Language - Java
API 16 - Android 4.1
```

## run device manager

```
Pixel 3
Android 8.1 (API 27)
```

## device manager

this setting works on physical but not azure vm

```
4 WVGA Nexus S API 22
Lollipop Android 5.1
```


## using docker image with android studio

instead of installing android studio we can use a docker image with android studio already on it.

on azure, use this image `Standard D2s v3 (2 vcpus, 8 GiB memory)` which is a little bit slow - get faster next time

try this windows docker image

```powershell
docker pull kelvinlawson/android-studio
```

or this linux one (will have to install docker desktop and from the system tray switch to using linux containers)

```bash
docker pull deadolus/android-studio
```

## device manager

if we are getting the message that the emulator is not running we can go to `C:\Users\YourUserName\AppData\Local\Google\AndroidStudio2020.3\log\idea.log` to view the error




### configure android studio path

if android studio is not installed or detected, please install it as above and optionally, if still not detected, specify the path using 

```bash
flutter config --android-studio-dir <<path to android studio sdk folder>>
```

### accept android licenses

type

```bash
flutter doctor --android-licenses
```

and accept all licencses

### install android studio command line tools

to install the android studio command line tools open android studio => system settings => android sdk
then click on the `sdk tools` tab and tick `android sdk (command-line tools) and run the install

### enabling developer tools on android device

On your android device enable developer options by going `settings`, `developer options`, `on`.  
On older devices, the sequence may be `settings`, `about device`, tap on `build number` several times.

### enable google usb driver in android studio

Next, run Android Studio, Tools, SDK Manager and tick `Google USB Driver`

## Add a device

Other commands to run are 

```bash
flutter devices
```

## configure android studio for flutter

```
Android Studio, file, settings, plugins
Search for flutter and install (with dart)
Restart Android Studio
```

now can select File, New, Flutter Project




## install flutter on mac

the following are instructions to install flutter on a MAC

### install vscode

install VSCode from https://code.visualstudio.com/download

###

add vscode to path 

```bash
command-shift-p
choose 'Shell Command: Install 'code' command in path
```

### install xcode

install xcode from the apple app store

xcode will include git which is required for this install

git can be installed separately but it is recommended to use xcode anyway, so this step is recommended by the flutter team

### install rosetta tools

if you are on an apple silicon mac, follow these steps

```bash
sudo softwareupdate --install-rosetta
# Install of Rosetta 2 finished successfully
```

### install flutter sdk

download flutter sdk from https://docs.flutter.dev/get-started/install

```
mv zip-file to-desired-location
unzip zip-file
```
























##  hello world

### build

to build our first `hello world` project we should run the following

```
flutter create HelloWorld
cd HelloWorld
```

### run

to run our app we can use

```java
// run on any browser
flutter run
// run on chrome
flutter run -d chrome
// run app and view network images over https:// from different domain
flutter run -d Chrome --web-renderer html
```



With chrome the response can be around 30 seconds so just be patient!  But eventually the app will launch and run in chrome web browser.

we see that the critical code which has been created and executed is to be found at `lib\main.dart`

if we strip out the existing code we can replace it with super-simple `hello world` code

```java
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```

we can add the text into a class

```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('hello world')
    );
  }
}
```

we can improve this slightly using the `const` keyword

```java
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('hello world from phil')
    );
  }
}
```

and we can add a title to our web page

```java
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hello World',
      home: Text('hello world from phil')
    );
  }
}
```

and a theme, also this is not active yet 

```java
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello World',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Text('hello world from phil2'));
  }
}
```

## remove debug mode

```java
MaterialApp(
  debugShowCheckedModeBanner: false,
),
```

## building your first project

to manually build our first project we only need 2 files

- projectRootFolder
  - pubspec.yaml
  - lib
    - main.dart

and optionally we can add a third

  - analysis-options.yaml

see worked example at [StarterApp01](../projects/StarterApp01)

### pubspec.yaml

```yaml
name: project
description: A new Flutter project.
publish_to: 'none'
version: 1.0.0+1
environment:
  sdk: ">=2.12.0 <3.0.0"
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0
flutter:
  uses-material-design: true
```

### analysis-options.yaml

```yaml
include: package:flutter_lints/flutter.yaml
linter:
  rules:
    avoid_print: false  # Uncomment to disable the `avoid_print` rule
```


### hello world

```java
//#region imports
import 'package:flutter/material.dart';
//#endregion imports
//#region main
void main() {
  print('running main app');
  runApp(App());
}
//#endregion main
//#region app
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static const String _title = 'Hello World';
  @override
  //#region widget builder
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: _title),
    );
  }
  //#endregion
}
//#endregion app
//#region home widget
class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
//#endregion widget
```

## default scaffolding

if we wish to build the app with a working button we can use the `flutter create myProject` command

```java
flutter create myProject
```

and we end up with this code (i have stripped out the extra comments)

```java
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
```

## app name

we can modify the app name in the `pubspec.yaml` file

## app icon

we can modify the app icon by choosing a new app icon image, generating the relevant app icon images for it by uploading it to https://appicon.co and then overwriting the default app icons at, for example, the path `android\app\src\main\res\`

## app images

we can use `network` images or `asset` images - network images are a url from the internet (better) or asset images are held locally - create an `images` folder in the root of your flutter project then link to it by referring it in the `pubspec.yaml` file as 

```yaml
flutter:
  uses-material-design: true
  assets:
   - images/
```

and then doing the `flutter packages get` command to install this folder as a default folder for images

## installing on mac

for the steps taken above which are worked through on a windows machine, the steps on mac will be very similar.

In summary some of the key points to install on MAC are

### download

- download zip from https://docs.flutter.dev/get-started/install/macos
- extract to a location of your choice eg ~/flutter/sdk

```java
cd ~
mkdir flutter
cd flutter
mkdir sdk
cd sdk
curl -o flutter-sdk.zip 'https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.0.5-stable.zip'
unzip flutter-sdk.zip
```

### add flutter to path

https://docs.flutter.dev/get-started/install/macos#update-your-path

```java
echo $SHELL
// /bin/zsh
cd /bin/zsh
// show hidden files and look for .zshrc file
ls -lah
// if absent create it
touch .zshrc
// edit it
nano .zshrc
// add flutter to path - add this line to file
export PATH="$PATH:/Users/<<yourUsername>>/flutter/sdk/bin"
```

confirm flutter is in the path by opening a new shell and running

```java
// show path to flutter sdk
echo $PATH
// confirm mac knows about flutter
where flutter
// /users/yourUser/flutter/sdk/bin
```


### flutter doctor

run flutter doctor and follow instructions to complete install

```java
flutter doctor
```

### cocoapods

```java
sudo gem install cocoapods
```

### xcode

install xcode then run

```java
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

### simulator

run the mac simulator with 

```java
open -a Simulator
```

### hello world

```java
flutter create testApp
cd testApp
flutter run
```






## next steps

to continue building on our app, follow the [next steps](next-steps.md) . . .  

[Continue ... next steps](next-steps.md)
