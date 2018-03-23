import 'package:parsers/parsers.dart';

class Arithmetic {
  //digits are parsed as int
  digits2int(digits) => int.parse(digits.join());

  //a lexeme are chars till the next space
  lexeme(parser) => parser < spaces;

  //a token is a lexeme of a string
  token(str) => lexeme(string(str));

  //the input is a expression (parse till 'end of file')
  get start => expr() < eof;

  //mult token is \u00D7
  get mult => token('\u00D7');

  //div token is \u00F7
  get div => token('\u00F7');

  //add token is +
  get add => token('+');

  //sub token is -
  get sub => token('-');

  //number has many digits
  get number => lexeme(digit.many1) ^ digits2int;

  //expression is 'above' term, so term would be replaced first then addop
  expr() => rec(term).chainl1(lineOp);

  //term is 'above' number, so number would be replaced first then multop
  term() => rec(atom).chainl1(dotOp);

  //number is the lowest level, start here with replacing
  atom() => number;

  //line operators are two numbers combined with + or -
  get lineOp =>
      (add > success((x, y) => x + y)) | (sub > success((x, y) => x - y));

  //dot operators are two numbers combined with * or ~/
  get dotOp =>
      (mult > success((x, y) => x * y)) | (div > success((x, y) => x ~/ y));
}

String calculate(final String toResolve) {
  //result of empty input should be 0
  if (toResolve.isEmpty) return "0";
  print(toResolve);
  //parse the input and return the result as string
  return new Arithmetic().start.parse(toResolve).toString();
}
