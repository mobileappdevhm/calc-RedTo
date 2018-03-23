import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// list of staggered tiles
const List<StaggeredTile> staggeredTiles = const <StaggeredTile>[
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
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 1),
];

//constants of all used symbols
const String symbolReset = "c";
const String symbolDelete = "\u232B";
const String symbolDivide = "\u00F7";
const String symbolMultiply = "\u00D7";
const String symbolSub = "-";
const String symbolAdd = "+";
const String symbolResult = "=";
const String symbolPoint = ".";

//constants of all used input types
const String inputTypeNumber = "number";
const String inputTypeSymbol = "symbol";
const String inputTypeNegative = "negative";
const String inputTypeResult = "result";
const String inputTypeNumberResult = inputTypeNumber + " " + inputTypeResult;
const String inputTypeNumberZero = inputTypeNumber + " zero";
const String inputTypePointNumber = "point " + inputTypeNumber;
