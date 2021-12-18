# syntax

## contents

- [syntax](#syntax)
  - [contents](#contents)
  - [introduction](#introduction)
  - [keywords](#keywords)
    - [static](#static)
    - [final](#final)
  - [strings](#strings)
    - [String Interpolation](#string-interpolation)
  - [sleep](#sleep)

## introduction

here is an introduction to flutter variables and syntax

## keywords

### static

### final

final modifies variables and must be initialised

```java
final url = "https://...";
```

## strings

### String Interpolation

```java
print('id : ${_responseObject.id.toString()}, title: ${_responseObject.title}, body: ${_responseObject.body}, userId: ${_responseObject.userId}')
```

## sleep

```java
import 'dart:io';
const duration = 4;
print('sleeping for $duration seconds');
sleep(const Duration(seconds: 4));
print('sleep over');
```

sleep can also be part of an async function

```java
void _sleep() async {
  const duration = 4;
  print('sleeping for $duration seconds');
  await Future.delayed(Duration(seconds: duration));
  print('sleep over');
}
```