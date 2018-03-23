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
  const StaggeredTile.count(3, 1),
];

//constants of all used symbols
const String symbolReset = "c";
const String symbolDelete = "\u232B";
const String symbolDivide = "\u00F7";
const String symbolMultiply = "\u00D7";
const String symbolSub = "-";
const String symbolAdd = "+";
const String symbolResult = "=";

//constants of all used input types
const String inputTypNumber = "number";
const String inputTypSymbol = "symbol";
const String inputTypNegative = "negative";
const String inputTypResult = "result";
const String inputTypNumberResult = "number result";
