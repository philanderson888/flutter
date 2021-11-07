# unit testing

## contents 

- [unit testing](#unit-testing)
  - [contents](#contents)
  - [introduction](#introduction)
  - [simple example](#simple-example)

## introduction

it's important to be able to run unit tests for our components so this introduction will help you get started

## simple example

on the 'unit test 01' scaffolded code we 'pump' a button and see the text change from 0 to 1

```java
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unittest01/main.dart';
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
```