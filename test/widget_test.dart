// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/main.dart';

void main() {
  testWidgets('Numbers and symbols are displayed test', (WidgetTester tester) async {
    await tester.pumpWidget(new Calculator());
    // Verify that all buttons are displayed
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('c'), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text('/'), findsOneWidget);
    expect(find.text('<'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('='), findsOneWidget);
  });

  testWidgets('Simple add test', (WidgetTester tester) async {
    await tester.pumpWidget(new Calculator());
    await tester.tap(find.text('5'));
    await tester.pump();
    await tester.tap(find.text('+'));
    await tester.pump();
    await tester.tap(find.text('9'));
    await tester.pump();
    await tester.tap(find.text('='));
    await tester.pump();
    // Verify that the right result is displayed
    expect(find.text('14'), findsOneWidget);
  });

  testWidgets('Simple sub test', (WidgetTester tester) async {
    await tester.pumpWidget(new Calculator());
    await tester.tap(find.text('5'));
    await tester.pump();
    await tester.pump();
    await tester.tap(find.text('-'));
    await tester.pump();
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('='));
    await tester.pump();
    // Verify that the right result is displayed
    expect(find.text('54'), findsOneWidget);
  });

  testWidgets('Simple multiply test', (WidgetTester tester) async {
    await tester.pumpWidget(new Calculator());
    await tester.tap(find.text('2'));
    await tester.pump();
    await tester.tap(find.text('*'));
    await tester.pump();
    await tester.tap(find.text('8'));
    await tester.pump();
    await tester.tap(find.text('='));
    await tester.pump();
    // Verify that the right result is displayed
    expect(find.text('16'), findsOneWidget);
  });

  testWidgets('Simple divide test', (WidgetTester tester) async {
    await tester.pumpWidget(new Calculator());
    await tester.tap(find.text('7'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    await tester.tap(find.text('/'));
    await tester.pump();
    await tester.tap(find.text('6'));
    await tester.pump();
    await tester.tap(find.text('='));
    await tester.pump();
    // Verify that the right result is displayed
    expect(find.text('12'), findsOneWidget);
  });

  //TODO test calculator with large numbers
  //TODO test calculator with longer exercises
  //TODO test calculator with negative numbers
}
