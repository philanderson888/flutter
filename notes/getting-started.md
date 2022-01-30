# getting started

## table of contents
- [getting started](#getting-started)
  - [table of contents](#table-of-contents)
  - [getting started with an online ide](#getting-started-with-an-online-ide)
  - [samples](#samples)
  - [references](#references)
  - [install java](#install-java)
  - [install android studio](#install-android-studio)
  - [install flutter](#install-flutter)
  - [verify install](#verify-install)
    - [configure android studio path](#configure-android-studio-path)
    - [accept android licenses](#accept-android-licenses)
    - [install android studio command line tools](#install-android-studio-command-line-tools)
    - [enabling developer tools on android device](#enabling-developer-tools-on-android-device)
    - [enable google usb driver in android studio](#enable-google-usb-driver-in-android-studio)
  - [Add a device](#add-a-device)
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

first we must install java and set the environment variables for java.  Note obviously the java version mentioned will have changed, but all other details should be correct, ie replace 17.0.2 with the current version you are downloading

- go to environment variables and remove any PATH items for java or android studio
- install java at c:\program files\java\jdk-17.0.2\   https://www.oracle.com/java/technologies/downloads/#jdk17-windows
- set environment variable in PATH for c:\program files\java\jdk-17.0.2\bin
- set environment variable for JAVA_HOME as C:\Program Files\Java\jdk-17.0.2
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

## install android studio

install android studio from https://developer.android.com/studio before installing `flutter`

Android Studio will install at `C:\Program Files\Android\Android Studio` and the binary at`C:\Program Files\Android\Android Studio\bin`



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

```bash
flutter
dart
# show install locations on mac
where flutter dart
# show install locations on windows
where.exe flutter dart
```

and if the install has worked, these commands will produce output with further options

```
c:\Users\phila\flutter\bin\flutter
c:\Users\phila\flutter\bin\flutter.bat
c:\Users\phila\flutter\bin\dart
c:\Users\phila\flutter\bin\dart.bat
```

next run this command 

```java
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
