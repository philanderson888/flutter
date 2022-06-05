# syntax

## contents

- [syntax](#syntax)
  - [contents](#contents)
  - [introduction](#introduction)
  - [keywords](#keywords)
    - [static](#static)
    - [const](#const)
    - [final](#final)
  - [strings](#strings)
    - [String Interpolation](#string-interpolation)
  - [integers](#integers)
    - [double to integer](#double-to-integer)
    - [integer division](#integer-division)
  - [sleep](#sleep)
  - [collections](#collections)
    - [list](#list)
  - [enums](#enums)
  - [ternary](#ternary)

## introduction

here is an introduction to flutter variables and syntax

## keywords

### static

### const

the value of the variable must be known at compile time and will never change

fields inside a `const` complex object are also `const` ie cannot be reassigned (unlike Javascript)

`kThisName` convention can be used for constants

### final

once final has been instantiated once, it cannot be changed again afterwards.  So we have one chance to initialise it, then that's it.  It can't be changed later.

unlike `const` variables, `final` variables can be computed `once` at runtime.

fields in a `final` complex object can be reassigned

```java
final url = "https://...";
```

## strings

### String Interpolation

```java
print('id : ${_responseObject.id.toString()}, title: ${_responseObject.title}, body: ${_responseObject.body}, userId: ${_responseObject.userId}')
```

## integers

### double to integer

```java
double x = 100.0
// rounds
int y = x.round();
// truncate
int z = x.toInt();
// truncate
int a = x.truncate();
// ceiling
int b = x.ceil();
// floor
int c = x.floor();
```

### integer division

to divide but then output the answer as an integer, one can use

```java
int x = 33.3 ~/ 2;
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

## collections

### list

generate a list of numbers with the following code

```java
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 10,
          children: List.generate(20, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          }),
        ),
      ),
    );
  }
}
```

## enums

```java
enum Gender { male, female }

Gender.male
Gender.female
```

## ternary

```java
var marVariable = 11;
var max = 10;
myVariable > max ? print('overloaded') : print('within bounds');
```