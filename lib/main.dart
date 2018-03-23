import 'package:calculator/views/calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//main entry point
void main() {
  //set preferred orientation to portrait
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(new Main());
}

class Main extends StatelessWidget {
  // build the root of the calculator app
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Calculator(title: 'Flutter Calculator'),
    );
  }
}
