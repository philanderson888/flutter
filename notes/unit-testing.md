# unit testing

## contents 

- [unit testing](#unit-testing)
  - [contents](#contents)
  - [introduction](#introduction)
  - [simple example](#simple-example)
  - [verbose output](#verbose-output)
  - [finding a clickable widget by text](#finding-a-clickable-widget-by-text)

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

## verbose output

to run our unit tests with verbose output we write

```java
flutter test -r expanded test/widget_test.dart
```

## finding a clickable widget by text

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