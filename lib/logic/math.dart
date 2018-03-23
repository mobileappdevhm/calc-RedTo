import 'package:calculator/util/constants.dart';
import "package:math_expressions/math_expressions.dart";

class Math {
  static String getResult(String calculatorString) {
    if (calculatorString.length < 1) {
      return "0";
    }

    String calcString = _replaceCalculationSymbols(calculatorString);

    String result = "0";
    Parser p = new Parser();

    try {
      Expression exp = p.parse(calcString);
      num evaluate = exp.evaluate(EvaluationType.REAL, new ContextModel());
      result = _getNiceNumber(evaluate);
    } catch (e) {
      result = calculatorString;
    }

    return result;
  }

  static String _replaceCalculationSymbols(String calculatorString) {
    calculatorString = calculatorString.replaceAll(symbolDivide, "/");
    calculatorString = calculatorString.replaceAll(symbolMultiply, "*");
    return calculatorString;
  }

  static String _getNiceNumber(num result){
    if(result.floor() == result.ceil()){
      return result.toInt().toString();
    }
    return result.toString();
  }
}
