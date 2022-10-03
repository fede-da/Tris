import 'package:flutter/material.dart';
import 'package:tris/src/tris/turn/circle_turn.dart';
import 'package:tris/src/tris/turn/cross_turn.dart';
import 'package:tris/src/utils/my_painter.dart';

import '../common_widgets/tris/base_square.dart';
import '../common_widgets/tris/square.dart';
import '../tris/turn/turn.dart';

class TrisHandler extends ChangeNotifier {
  final double squareWidth;
  late MyPainter painter;
  List<Turn> turns = [CrossTurn(), CircleTurn()];

  TrisHandler({required this.squareWidth}) : super() {
    painter = MyPainter(length: squareWidth);
  }

  List<BaseSquare> squares = [
    Square(sides: const [2, 3]),
    Square(sides: const [2, 3]),
    Square(sides: const [2]),
    Square(sides: const [2, 3]),
    Square(sides: const [2, 3]),
    Square(sides: const [2]),
    Square(sides: const [3]),
    Square(sides: const [3]),
    Square(sides: const []),
  ];

  List<Signs> signs = [
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
  ];

  //index -> 0 to index - 1
  void changeSignAt(int index, Signs sign) {
    signs[index] = sign;
    notifyListeners();
    return;
  }

  MyPainter getPainter() => painter;

  List<BaseSquare> get3RowsFromIndex(int index) => [
        squares[index],
        squares[index + 1],
        squares[index + 2],
      ];

  void squareTappedAtIndex(int index) {
    squares[index] = getNewSquare(squares[index]);
    notifyListeners();
    swapTurn();
    return;
  }

  BaseSquare getNewSquare(BaseSquare square) =>
      turns[0].getSquareFromTurn(square.sides);

  void swapTurn() {
    Turn tmp = turns[0];
    turns[0] = turns[1];
    turns[1] = tmp;
    return;
  }
}

enum Signs { empty, circle, cross }

class EmptySign {
  Enum sign = Signs.empty;

  void drawCircle() {}

  void drawSquare() {}
}
