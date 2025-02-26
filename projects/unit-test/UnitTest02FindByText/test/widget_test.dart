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
    await tester.pumpWidget(const App());
    await tester.tap(find.text('Turn light on'));
    expect(find.text('Turn light on'), findsOneWidget);
    expect(find.text('Turn light off'), findsNothing);
    await tester.pump();
    expect(find.text('Turn light off'), findsOneWidget);
    expect(find.text('Turn light on'), findsNothing);
  });
}
