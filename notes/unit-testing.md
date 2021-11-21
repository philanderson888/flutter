# unit testing

## contents 

- [unit testing](#unit-testing)
  - [contents](#contents)
  - [introduction](#introduction)
  - [simple example](#simple-example)
  - [naming convention](#naming-convention)
  - [running unit tests](#running-unit-tests)
  - [finding by text](#finding-by-text)
  - [finding by icon](#finding-by-icon)

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

## naming convention

in order for our tests to be found automatically we should have#

MyProject/
  lib/
    my_project.dart
  test/
    my_test.dart

the unit tests must be

1)  in a \test\ folder
2)  suffixed _test.dart 

so the path must be `MyProject/test/..some_folder../my_test.dart`

## running unit tests

to run unit tests we run this command from the project root 

```java
flutter test
// verbose
flutter test -r expanded 
```

to run one unit test file we write

```java
flutter test test/my_test.dart
// verbose
flutter test -r expanded test/widget_test.dart
```


## finding by text

[finding a clickable widget by text](projects/../../projects/UnitTest02FindByText/)

we can find a clickable item on the screen by searching for the text of that item

here is the page code

```java
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  bool _isLightOn = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
      _isLightOn = !_isLightOn;
      print('you clicked $_counter times');
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.lightbulb_outline,
                color: _isLightOn ? Colors.yellow.shade600 : Colors.black,
                size: 60,
              ),
            ),
            GestureDetector(
              onTap: () => {
                setState(() {
                  bool toggleState = !_isLightOn;
                  print(
                      'light switch toggled from $_isLightOn to $toggleState ');
                  _isLightOn = !_isLightOn;
                  _counter++;
                })
              },
              child: Container(

                  color: Colors.yellow.shade600,
                  padding: const EdgeInsets.all(10),
                  child: Text(_isLightOn ? 'Turn light off' : 'Turn light on')),
            ),
            const Text(
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

and here is the test code

```java
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unittest02findbytext/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
  testWidgets('Items Present On The Screen THIS TEST IS NOT WORKING',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('pushed'), findsNothing);
  });
  testWidgets('Light Text Present', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Turn light on'), findsOneWidget);
  });
  testWidgets('light icon clickable find by text', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    await tester.tap(find.text('Turn light on'));
    expect(find.text('Turn light on'), findsOneWidget);
    expect(find.text('Turn light off'), findsNothing);
    await tester.pump();
    expect(find.text('Turn light off'), findsOneWidget);
    expect(find.text('Turn light on'), findsNothing);
  });
}
```

## finding by icon

see [UnitTest03](../projects/UnitTest03) for an example of finding widget by icon and clicking on a button twice and verifying text has changed both times

``java
testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
  expect(find.text('Home Screen'), findsOneWidget);
  expect(find.text('here is some text'), findsOneWidget);
  expect(find.text('here is a third line'), findsOneWidget);
  await tester.tap(find.byIcon(Icons.access_alarm));
  await tester.pump();
  expect(find.text('Odd'), findsNWidgets(2));
  expect(find.text('Even'), findsNothing);
  await tester.tap(find.byIcon(Icons.access_alarm));
  await tester.pump();
  expect(find.text('Odd'), findsNothing);
  expect(find.text('Even'), findsNWidgets(2));
});
```