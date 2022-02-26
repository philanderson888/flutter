# getting started with android studio 

## contents

- [getting started with android studio](#getting-started-with-android-studio)
  - [contents](#contents)
  - [introduction](#introduction)
  - [first project](#first-project)
    - [hot reload and hot restart](#hot-reload-and-hot-restart)

## introduction

android studio is a highly advanced ide and takes a while to get used to 

## first project

file => new => flutter project

to ensure everything is built in the same folder, one can remove the extra folder path for the `content root` and `module file location` which will help everything to be built in a flat file structure without too many subfolders

### hot reload and hot restart

when we have a `build` method we should get automatic `hot reload` or if not, click `control - \`

hot reload and restart just reload changes to the app, and nothing else, so it's very quick.

- hot reload `control \` keeps app state
- hot restart `control shift \` resets app state


```java
import 'package:flutter/material.dart';
void main() {
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Container(),
      ),
    );
  }
}
```

