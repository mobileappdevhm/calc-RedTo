import 'package:calculator/views/calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/util/constants.dart';
Finder getResultAsFinder(String resultText) {
  return find.widgetWithText(InkWell, resultText);
}

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding)
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  final Finder button1 = find.widgetWithText(InkWell,'1');
  final Finder button2 = find.widgetWithText(InkWell, '2');
  final Finder button3 = find.widgetWithText(InkWell, '3');
  final Finder button4 = find.widgetWithText(InkWell, '4');
  final Finder button5 = find.widgetWithText(InkWell, '5');
  final Finder button6 = find.widgetWithText(InkWell, '6');
  final Finder button7 = find.widgetWithText(InkWell, '7');
  final Finder button8 = find.widgetWithText(InkWell, '8');
  final Finder button9 = find.widgetWithText(InkWell, '9');
  final Finder button0 = find.widgetWithText(InkWell, '0');
  final Finder buttonReset = find.widgetWithText(InkWell, symbolReset);
  final Finder buttonMult = find.widgetWithText(InkWell, symbolMultiply);
  final Finder buttonDiv = find.widgetWithText(InkWell, symbolDivide);
  final Finder buttonDelete = find.widgetWithText(InkWell, symbolDelete);
  final Finder buttonAdd = find.widgetWithText(InkWell, symbolAdd);
  final Finder buttonSub = find.widgetWithText(InkWell, symbolSub);
  final Finder buttonResult = find.widgetWithText(InkWell, symbolResult);
  final Finder buttonPoint = find.widgetWithText(InkWell, symbolPoint);

  Widget pumpWidget;

  setUp((){
    pumpWidget = new MaterialApp(home: new Calculator(title: 'Flutter Calculator'));
  });

  testWidgets('Numbers and symbols are displayed test',
      (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);
    // Verify that all buttons are displayed
    expect(button0, findsOneWidget);
    expect(button1, findsOneWidget);
    expect(button2, findsOneWidget);
    expect(button3, findsOneWidget);
    expect(button4, findsOneWidget);
    expect(button5, findsOneWidget);
    expect(button6, findsOneWidget);
    expect(button7, findsOneWidget);
    expect(button8, findsOneWidget);
    expect(button9, findsOneWidget);
    expect(buttonReset, findsOneWidget);
    expect(buttonDelete, findsOneWidget);
    expect(buttonMult, findsOneWidget);
    expect(buttonDiv, findsOneWidget);
    expect(buttonAdd, findsOneWidget);
    expect(buttonSub, findsOneWidget);
    expect(buttonResult, findsOneWidget);
    expect(buttonPoint, findsOneWidget);
  });

  testWidgets('test buttonReset', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button1);
    await tester.pump();
    expect(getResultAsFinder("1"), findsWidgets);

    await tester.tap(buttonReset);
    await tester.pump();
    expect(getResultAsFinder(""), findsWidgets);
  });
  testWidgets('test buttonDiv', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(buttonDiv);
    await tester.pump();
    expect(getResultAsFinder(""), findsWidgets);
  });
  testWidgets('test buttonMult', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(buttonMult);
    await tester.pump();
    expect(getResultAsFinder(""), findsWidgets);
  });
  testWidgets('test buttonDelete', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(buttonDelete);
    await tester.pump();
    expect(getResultAsFinder(""), findsWidgets);
  });

  testWidgets('test button1', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button1);
    await tester.pump();
    expect(getResultAsFinder("1"), findsWidgets);
  });

  testWidgets('test button2', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button2);
    await tester.pump();
    expect(getResultAsFinder("2"), findsWidgets);
  });
  testWidgets('test button3', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button3);
    await tester.pump();
    expect(getResultAsFinder("3"), findsWidgets);
  });
  testWidgets('test buttonSub', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(buttonSub);
    await tester.pump();
    expect(getResultAsFinder(""), findsWidgets);
  });

  testWidgets('test button4', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button4);
    await tester.pump();
    expect(getResultAsFinder("4"), findsWidgets);
  });
  testWidgets('test button5', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button5);
    await tester.pump();
    expect(getResultAsFinder("5"), findsWidgets);
  });
  testWidgets('test button6', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button6);
    await tester.pump();
    expect(getResultAsFinder("6"), findsWidgets);
  });
  testWidgets('test buttonAdd', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(buttonAdd);
    await tester.pump();
    expect(getResultAsFinder(""), findsWidgets);
  });
  testWidgets('test button7', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button7);
    await tester.pump();
    expect(getResultAsFinder("7"), findsWidgets);
  });
  testWidgets('test button8', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button8);
    await tester.pump();
    expect(getResultAsFinder("8"), findsWidgets);
  });
  testWidgets('test button9', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button9);
    await tester.pump();

    expect(getResultAsFinder("9"), findsWidgets);
  });
  testWidgets('test buttonResult', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(buttonResult);
    await tester.pump();
    expect(getResultAsFinder("0"), findsWidgets);
  });
  testWidgets('test button0', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button0);
    await tester.pump();

    expect(getResultAsFinder("0"), findsWidgets);
  });

  testWidgets('Number test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    expect(button1, findsOneWidget);
    expect(button2, findsOneWidget);
    expect(button3, findsOneWidget);
    expect(button4, findsOneWidget);
    expect(button5, findsOneWidget);
    expect(button6, findsOneWidget);
    expect(button7, findsOneWidget);
    expect(button8, findsOneWidget);
    expect(button9, findsOneWidget);
    expect(button0, findsOneWidget);

    await tester.tap(button1);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();
    await tester
        .pump(const Duration(seconds: 1)); // Wait until it has finished.

    expect(getResultAsFinder("12"), findsOneWidget);
  });

  testWidgets('Simple add test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button5);
    await tester.pump();
    await tester.tap(buttonAdd);
    await tester.pump();
    await tester.tap(button9);
    await tester.pump();
    await tester.tap(buttonResult);
    await tester.pump();
    // Verify that the right result is displayed
    expect(getResultAsFinder('14'), findsOneWidget);
  });

  testWidgets('Simple sub test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button5);
    await tester.pump();
    await tester.pump();
    await tester.tap(buttonSub);
    await tester.pump();
    await tester.tap(button1);
    await tester.pump();
    await tester.tap(buttonResult);
    await tester.pump();
    // Verify that the right result is displayed
    expect(getResultAsFinder('4'), findsWidgets);
  });

  testWidgets('Simple multiply test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button2);
    await tester.pump();
    await tester.tap(buttonMult);
    await tester.pump();
    await tester.tap(button8);
    await tester.pump();
    await tester.tap(buttonResult);
    await tester.pump();
    // Verify that the right result is displayed
    expect(getResultAsFinder('16'), findsOneWidget);
  });

  testWidgets('Simple divide test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button7);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();
    await tester.tap(buttonDiv);
    await tester.pump();
    await tester.tap(button6);
    await tester.pump();
    await tester.tap(buttonResult);
    await tester.pump();
    // Verify that the right result is displayed
    expect(getResultAsFinder('12'), findsOneWidget);
  });

  testWidgets('Long divide test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button1);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();
    await tester.tap(button3);
    await tester.pump();
    await tester.tap(button4);
    await tester.pump();
    await tester.tap(button5);
    await tester.pump();
    await tester.tap(button6);
    await tester.pump();
    await tester.tap(button7);
    await tester.pump();
    await tester.tap(button8);
    await tester.pump();
    await tester.tap(button9);
    await tester.pump();
    await tester.tap(button0);
    await tester.pump();
    await tester.tap(buttonDiv);
    await tester.pump();
    await tester.tap(button1);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();
    await tester.tap(button3);
    await tester.pump();
    await tester.tap(button4);
    await tester.pump();
    await tester.tap(button5);
    await tester.pump();
    await tester.tap(button6);
    await tester.pump();
    await tester.tap(button7);
    await tester.pump();
    await tester.tap(button8);
    await tester.pump();
    await tester.tap(button9);
    await tester.pump();
    await tester.tap(buttonResult);
    await tester.pump();
    // Verify that the right result is displayed
    expect(getResultAsFinder('10'), findsOneWidget);
  });

  testWidgets('long number add test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button9);
    await tester.pump();
    await tester.tap(button8);
    await tester.pump();
    await tester.tap(button7);
    await tester.pump();
    await tester.tap(button6);
    await tester.pump();
    await tester.tap(button5);
    await tester.pump();
    await tester.tap(button4);
    await tester.pump();
    await tester.tap(buttonAdd);
    await tester.pump();
    await tester.tap(button1);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();
    await tester.tap(button3);
    await tester.pump();
    await tester.tap(button4);
    await tester.pump();
    await tester.tap(button6);
    await tester.pump();
    await tester.tap(buttonResult);
    await tester.pump();

    expect(getResultAsFinder('1000000'), findsOneWidget);

  });


  testWidgets('symbol change test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button5);
    await tester.pump();
    await tester.tap(buttonAdd);
    await tester.pump();
    await tester.tap(buttonSub);
    await tester.pump();
    await tester.tap(buttonDiv);
    await tester.pump();
    await tester.tap(buttonMult);
    await tester.pump();
    await tester.tap(button6);
    await tester.pump();
    await tester.tap(buttonResult);
    await tester.pump();

    expect(getResultAsFinder('30'), findsOneWidget);

  });


  testWidgets('long calculation test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button5);
    await tester.pump();
    await tester.tap(buttonAdd);
    await tester.pump();
    await tester.tap(button1);
    await tester.pump();
    await tester.tap(buttonSub);
    await tester.pump();
    await tester.tap(button4);
    await tester.pump();
    await tester.tap(buttonDiv);
    await tester.pump();
    await tester.tap(button2);
    await tester.pump();
    await tester.tap(buttonMult);
    await tester.pump();
    await tester.tap(button3);
    await tester.pump();
    await tester.tap(buttonResult);
    await tester.pump();

    expect(getResultAsFinder('0'), findsWidgets);

  });

  testWidgets('point calculation test', (WidgetTester tester) async {
    await tester.pumpWidget(pumpWidget);

    await tester.tap(button5);
    await tester.pump();
    await tester.tap(buttonPoint);
    await tester.pump();
    await tester.tap(button1);
    await tester.pump();
    await tester.tap(buttonSub);
    await tester.pump();
    await tester.tap(button0);
    await tester.pump();
    await tester.tap(buttonPoint);
    await tester.pump();
    await tester.tap(button5);
    await tester.pump();
    await tester.tap(buttonResult);
    await tester.pump();

    expect(getResultAsFinder('4.6'), findsWidgets);
  });
}
