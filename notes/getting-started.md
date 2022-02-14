# getting started

## table of contents
- [getting started](#getting-started)
  - [table of contents](#table-of-contents)
  - [getting started with an online ide](#getting-started-with-an-online-ide)
  - [samples](#samples)
  - [references](#references)
  - [install java](#install-java)
  - [android sdk](#android-sdk)
    - [updating sdk](#updating-sdk)
  - [emulator](#emulator)
  - [install android studio](#install-android-studio)
  - [run a new project to test Android Studio](#run-a-new-project-to-test-android-studio)
  - [run device manager](#run-device-manager)
  - [device manager](#device-manager)
  - [using docker image with android studio](#using-docker-image-with-android-studio)
  - [device manager](#device-manager-1)
  - [install flutter](#install-flutter)
  - [verify install](#verify-install)
    - [configure android studio path](#configure-android-studio-path)
    - [accept android licenses](#accept-android-licenses)
    - [install android studio command line tools](#install-android-studio-command-line-tools)
    - [enabling developer tools on android device](#enabling-developer-tools-on-android-device)
    - [enable google usb driver in android studio](#enable-google-usb-driver-in-android-studio)
  - [Add a device](#add-a-device)
  - [configure android studio for flutter](#configure-android-studio-for-flutter)
  - [hello world](#hello-world)
    - [build](#build)
    - [run](#run)
  - [building your first project](#building-your-first-project)
    - [pubspec.yaml](#pubspecyaml)
    - [analysis-options.yaml](#analysis-optionsyaml)
    - [hello world](#hello-world-1)
  - [default scaffolding](#default-scaffolding)
  - [next steps](#next-steps)

## getting started with an online ide

flutter can be tried out instantly online using flutter's own website at https://flutter.dev/

It can also be used at [Flutter Studio](https://flutterstudio.app)

## samples

to see examples of samples available online please see

- widgets https://flutter.dev/docs/development/ui/widgets
- material design ui https://material.io/develop/flutter

## references

please see the following references for further help with regards to installing and getting started with using flutter

- https://www.javatpoint.com/flutter-installation

## install java

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


## android sdk

can separately download this and put it wherever you want and perhaps add it to path

default is `~\AppData\Local\Android\Sdk`

notice that we need this whenever we create a new project ie

file=>new=>flutter project

the path to the SDK is present.

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

install android studio from https://developer.android.com/studio before installing `flutter`

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

```powershell
docker pull deadolus/android-studio
```

## device manager

if we are getting the message that the emulator is not running we can go to `C:\Users\YourUserName\AppData\Local\Google\AndroidStudio2020.3\log\idea.log` to view the error



## install flutter

to install flutter download the zip file from https://flutter.dev/docs/get-started/install 

Choose a location such as c:\users\username\ and unzip the zip file so the path to flutter becomes

c:\users\username\flutter 

add the `flutter\bin` path to your environment variables, for example in the example above the path would be `c:\users\username\flutter\bin` which would be added to your `path` system variable 

On Windows, to do this, complete the following steps
1. Hit the Windows key
2. Type `env`
3. Select `edit system environment variables`
4. Choose `environment variables`
5. In `system variables` find `path` and click `edit` 
6. Click `new` to add a new entry to the path variables
7. Paste `c:\users\username\flutter\bin`
8. Press OK several times to save and exit
   
*note - changes may not take place until after a windows restart*

to test this has worked, simply run these commands

```js
flutter
dart
//show install locations on mac
where flutter dart
// show install locations on windows
where.exe flutter dart
/*
c:\Users\phila\flutter\bin\flutter
c:\Users\phila\flutter\bin\flutter.bat
c:\Users\phila\flutter\bin\dart
c:\Users\phila\flutter\bin\dart.bat
*/
```

and if the install has worked, these commands will produce output with further options

```js
c:\Users\phila\flutter\bin\flutter
c:\Users\phila\flutter\bin\flutter.bat
c:\Users\phila\flutter\bin\dart
c:\Users\phila\flutter\bin\dart.bat
```

next run this command 

```js
flutter doctor
```

This should identify which programs need to be installed for the full flutter experience to work properly.

```
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

## verify install

check the install has worked by running

```bash
flutter doctor
```

### configure android studio path

if android studio is not installed or detected, please install it as above and optionally, if still not detected, specify the path using 

```
flutter config --android-studio-dir <<path to android studio sdk folder>>
```

### accept android licenses

type

```
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

```
flutter devices
```

## configure android studio for flutter

```
Android Studio, file, settings, plugins
Search for flutter and install (with dart)
Restart Android Studio
```

now can select File, New, Flutter Project

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

## next steps

to continue building on our app, follow the [next steps](next-steps.md) . . .  

[Continue ... next steps](next-steps.md)
