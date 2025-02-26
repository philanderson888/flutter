import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:MultiPage04/main.dart';
void main() {
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
}
