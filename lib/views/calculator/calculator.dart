import 'package:calculator/logic/math.dart';
import 'package:calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Calculator extends StatefulWidget {
  final String title;

  //create a new calculator with a new key and a title given in constructor
  Calculator({Key key, this.title}) : super(key: key);

  //the calculator has a state, create a new one
  @override
  _CalculatorState createState() => new _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //calculator string - includes all valid input
  String _calculatorString;

  //all input types which were concat to the calculator string are saved here
  List<String> _inputTypes;

  @override
  void initState() {
    super.initState();
    _calculatorString = "";
    _inputTypes = new List<String>();
  }

  //calculate how many tiles go into one line
  int getTileCount(BuildContext context) {
    //check if orientation is landscape and increase button size
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return 9;
    } else {
      return 4;
    }
  }

  //build the widget of the current state
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // set the appbar title by the title of the previous build object
          title: new Text(widget.title),
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: new StaggeredGridView.count(
              crossAxisCount: getTileCount(context),
              staggeredTiles: staggeredTiles,
              children: <Widget>[
                new Card(
                  color: Colors.white,
                  child: new InkWell(
                    child: new Center(
                      child: new Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: new Text(
                          //show the current state of calculator string here
                          '$_calculatorString',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    ),
                  ),
                ),
                //create all symbols and number cards
                _createSymbolCard(symbolReset),
                _createSymbolCard(symbolDivide),
                _createSymbolCard(symbolMultiply),
                _createSymbolCard(symbolDelete),
                _createNumberCard(1),
                _createNumberCard(2),
                _createNumberCard(3),
                _createSymbolCard(symbolSub),
                _createNumberCard(4),
                _createNumberCard(5),
                _createNumberCard(6),
                _createSymbolCard(symbolAdd),
                _createNumberCard(7),
                _createNumberCard(8),
                _createNumberCard(9),
                _createSymbolCard(symbolResult),
                _createNumberCard(0),
                _createSymbolCard(symbolPoint),
              ],
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )));
  }

  //function which is fired on 'reset' button click
  _resetClick() {
    setState(() {
      _calculatorString = "";
      _inputTypes = new List<String>();
    });
  }

  //function which is fired on 'delete last input' button click
  _deleteLastClick([int size = 1]) {
    setState(() {
      if (_calculatorString.isNotEmpty && _inputTypes.isNotEmpty) {
        _calculatorString =
            _calculatorString.substring(0, _calculatorString.length - size);
        _inputTypes.removeLast();
      } else {
        _resetClick();
      }
    });
  }

  //function which is fired on 'number' button click
  _numberClick(int number) {
    if (_checkInputType(inputTypeResult)) {
      _resetClick();
    }
    if (_checkInputType(inputTypeNumberZero)) {
      _deleteLastClick();
    }

    String inputType = "";
    if(_checkInputType(inputTypePointNumber)){
      inputType = inputTypePointNumber;
    } else {
      if (number > 0) {
        inputType = inputTypeNumber;
      } else {
        inputType = inputTypeNumberZero;
      }
    }

    setState(() {
      _calculatorString += number.toString();
      _inputTypes.add(inputType);
    });
  }

  //function which is fired on 'result' button click
  _resultClick() {
    //if last input type was not number, delete the input which is not needed
    if (_checkInputType(inputTypeSymbol)) {
      //delete last input if input type is symbol
      _deleteLastClick();
    } else if (_checkInputType(inputTypeNegative)) {
      //delete the last two inputs if input type is negative
      _deleteLastClick(2);
    }

    String toResolve = _calculatorString;

    setState(() {
      //clear the history
      _resetClick();
      //calculate the result
      //_calculatorString = calculate(toResolve);
      _calculatorString = Math.getResult(toResolve);
      _inputTypes.add(inputTypeNumberResult);
    });
  }

  //function which is fired on 'symbol' button click
  _symbolClick(String symbol) {
    if (symbol == symbolReset) {
      _resetClick();
    } else if (symbol == symbolDelete) {
      _deleteLastClick();
    } else if (symbol == symbolResult) {
      _resultClick();
    } else
    //depending on input type the actions will be chosen


    if(symbol == symbolPoint && _checkInputType(inputTypePointNumber)){
      //do nothing
    } else if (_checkInputType(inputTypeNumber)) {
      setState(() {
        _calculatorString += symbol;
        if(symbol == symbolPoint){
          _inputTypes.add(inputTypePointNumber);
        } else {
          _inputTypes.add(inputTypeSymbol);
        }
      });
    } else if (_checkInputType(inputTypeSymbol)) {
      setState(() {
        _calculatorString =
            _calculatorString.substring(0, _calculatorString.length - 1);
        _calculatorString += symbol;
        if(symbol == symbolPoint){
          _inputTypes.add(inputTypePointNumber);
        } else {
          _inputTypes.add(inputTypeSymbol);
        }
      });
    }
  }

  //check if the last input type contains a given type
  bool _checkInputType(String type) {
    if (_inputTypes.length < 1) {
      return false;
    }
    return _inputTypes[_inputTypes.length - 1].contains(type);
  }

  Widget _createNumberCard(int number) {
    return new Card(
      color: Colors.grey,
      child: new InkWell(
        onTap: () {
          _numberClick(number);
        },
        child: _createCardText(number.toString()),
      ),
    );
  }

  Widget _createSymbolCard(String symbol) {
    return new Card(
      color: Colors.grey,
      child: new InkWell(
        onTap: () {
          _symbolClick(symbol);
        },
        child: _createCardText(symbol),
      ),
    );
  }

  Widget _createCardText(String text) {
    return new Center(
      child: new Text(
        text,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
