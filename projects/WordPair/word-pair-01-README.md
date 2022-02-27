# WordPair01

## Introduction

This is a sequence of projects following [Traversy Media](https://www.youtube.com/channel/UC29ju8bIPH5as8OGnQzwJyA) building a flutter application using Dart.  The YouTube link is [https://www.youtube.com/watch?v=1gDhl4leEzA](https://www.youtube.com/watch?v=1gDhl4leEzA).

If you're following, have fun!

## Install

1. Android Studio https://developer.android.com/studio
2. Flutter https://flutter.dev/ 
3. Flutter SDK https://flutter.dev/docs/get-started/install/windows
4. Unzip Flutter ZIP file at F:\ 
5. Add F:\flutter\bin to PATH
   
## Verify

```js
flutter doctor
flutter doctor --android-licenses
```

1. Android Studio - Install the `flutter` plugin
2. Attach an Android device and allow USB debugging on it for this machine (follow the prompts which may take up to a minute to show, in sequence as there are several messages which appear, the last one being the USB debugging one)

Continue until `flutter doctor` shows all ticks

![flutter-doctor.png](flutter-doctor.png)

## Application Overview

Goal of the application is to generate `WordPairs` which can be used for usernames or servernames.  We can also `like` favourite icons and also we can have a menu which drops down and allows us to select another page to view `liked` icons.

## Create app with `flutter create`

```js
flutter create WordPair01
```

## Run App by updating `launch.json`

The app runs fine from Android Studio.

However it's not running by default from VSCode but demands a path to the file `lib\main.dart` which is the entry point to the program.

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Dart",
            "program": "c:/github/flutter/Projects/WordPair01/lib/main.dart",
            "request": "launch",
            "type": "dart"
        }
    ]
}
```

## End

Note that this project developed an error and so was deleted and replaced by `WordPair02`




