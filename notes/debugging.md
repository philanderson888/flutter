# debugging

## contents

- [debugging](#debugging)
  - [contents](#contents)
  - [debug mode](#debug-mode)
  - [release mode](#release-mode)
  - [profile mode](#profile-mode)
  - [determining the mode](#determining-the-mode)

## debug mode

`flutter run` compiles to `debug mode`

```java
flutter run
```

## release mode

`flutter run --release` compiles to `release mode`

```java
flutter run --release
```

## profile mode

`flutter run --profile` enables this mode.

profile mode is close to release mode, but allows some debugging so that the performance of the release version of the code can be followed

```java
flutter run --profile
```

## determining the mode

```java
import 'package:flutter/foundation.dart';
void main() async {
  if (kDebugMode) {
    print('app is running in debug mode');
  }
  else {
    print('app is running in release mode');
  }
```

