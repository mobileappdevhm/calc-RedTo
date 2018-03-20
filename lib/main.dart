import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'arithmetic.dart';

void main() => runApp(new Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Calculator(),
    );
  }
}

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(4, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(3, 1),
];

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => new CalculatorState();
}

class CalculatorState extends State<Calculator> {
  static const String resetSymbol = "c";
  static const String deleteSymbol = "\u232B";
  static const String divideSymbol = "\u00F7";
  static const String multiplySymbol = "\u00D7";
  static const String subSymbol = "-";
  static const String addSymbol = "+";
  static const String resultSymbol = "=";

  String _input = "";
  List<String> _inputTypes = new List<String>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Calculator'),
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: <Widget>[
                new Card(
                  color: Colors.white,
                  child: new InkWell(
                    onTap: () {},
                    child: new Center(
                      child: new Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: new Text(
                          '$_input',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    ),
                  ),
                ),
                createSymbolCard(resetSymbol),
                createSymbolCard(divideSymbol),
                createSymbolCard(multiplySymbol),
                createSymbolCard(deleteSymbol),
                createNumberCard(1),
                createNumberCard(2),
                createNumberCard(3),
                createSymbolCard(subSymbol),
                createNumberCard(4),
                createNumberCard(5),
                createNumberCard(6),
                createSymbolCard(addSymbol),
                createNumberCard(7),
                createNumberCard(8),
                createNumberCard(9),
                createSymbolCard(resultSymbol),
                createNumberCard(0),
              ],
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )));
  }

  void _resetClick() {
    setState(() {
      _input = "";
      _inputTypes = new List<String>();
    });
  }

  void _deleteLastClick() {
    setState(() {
      if (_input.length > 0 && _inputTypes.length > 0) {
        _input = _input.substring(0, _input.length - 1);
        _inputTypes.removeLast();
      } else {
        _resetClick();
      }
    });
  }

  void _numberClick(int number) {
    setState(() {
      if (_inputTypes.length > 0) {
        if (_inputTypes[_inputTypes.length - 1] != "number") {
          if (number != 0) {
            _input += number.toString();
            _inputTypes.add("number");
          }
        } else {
          _input += number.toString();
          _inputTypes.add("number");
        }
      } else {
        _input += number.toString();
        _inputTypes.add("number");
      }
    });
  }

  void _calculateResult() {
    String toResolve = _input.replaceAll(divideSymbol, "~/");
    toResolve = toResolve.replaceAll(multiplySymbol, "*");
    setState(() {
      _input = calculate(toResolve);
    });
  }

  bool _checkInputType(String type) {
    if (_inputTypes.length < 1) {
      return false;
    }
    return _inputTypes[_inputTypes.length - 1].contains(type);
  }

  void _symbolClick(String symbol) {
    if (symbol == deleteSymbol) {
      _deleteLastClick();
    } else if (symbol == resultSymbol) {
      _calculateResult();
    } else if (symbol == resetSymbol) {
      _resetClick();
    } else if ((_checkInputType("") || _checkInputType("dot")) &&
        symbol == subSymbol) {
      setState(() {
        _input += symbol;
        _inputTypes.add("negative");
      });
    } else if (_checkInputType("number")) {
      setState(() {
        _input += symbol;
        _inputTypes.add("symbol");
      });
    } else if (_checkInputType("symbol")) {
      setState(() {
        _input = _input.substring(0, _input.length - 1);
        _input += symbol;
        if (symbol == multiplySymbol || symbol == divideSymbol) {
          _inputTypes.add("symbol dot");
        } else {
          _inputTypes.add("symbol");
        }
      });
    }
  }

  Widget createNumberCard(int number) {
    return new Card(
      color: Colors.grey,
      child: new InkWell(
        onTap: () {
          _numberClick(number);
        },
        child: new Center(
          child: new Text(
            number.toString(),
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget createSymbolCard(String symbol) {
    //TODO use final GestureTapCallback onTap;
    return new Card(
      color: Colors.grey,
      child: new InkWell(
        onTap: () {
          _symbolClick(symbol);
        },
        child: new Center(
          child: new Text(
            symbol,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
