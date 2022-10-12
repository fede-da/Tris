import 'package:flutter/material.dart';
import 'package:tris/src/tris/turn/circle_turn.dart';
import 'package:tris/src/tris/turn/cross_turn.dart';
import 'package:tris/src/utils/my_painter.dart';

import '../common_widgets/dialogue.dart';
import '../common_widgets/tris/base_square.dart';
import '../common_widgets/tris/signs.dart';
import '../common_widgets/tris/square.dart';
import '../tris/turn/turn.dart';

class TrisHandler extends ChangeNotifier {
  final double squareWidth;
  late MyPainter painter;
  BuildContext context;
  List<Turn> turns = [CrossTurn(), CircleTurn()];
  int _mosse = 9;

  TrisHandler({required this.context, required this.squareWidth}) : super() {
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

  MyPainter getPainter() => painter;

  List<BaseSquare> get3RowsFromIndex(int index) => [
        squares[index],
        squares[index + 1],
        squares[index + 2],
      ];

  void squareTappedAtIndex(int index) {
    BaseSquare newSquare = getNewSquare(squares[index]);
    squares[index] = newSquare;
    signs[index] = newSquare.sign;
    print(signs[index]);
    notifyListeners();
    checkWin(index, newSquare.sign);
    decMosse();
    swapTurn();
    return;
  }

  void checkWin(int index, Signs sign) {
    int elemNumber = index;
    int columnIndex = (elemNumber ~/ 3) * 3;
    List<int> columnIndexes = [columnIndex, columnIndex + 1, columnIndex + 2];
    print(columnIndexes);
    int rowIndex = elemNumber % 3;
    List<int> rowIndexes = [rowIndex, rowIndex + 3, rowIndex + 6];
    print(rowIndexes);
    if (columnIndexes.every((element) => signs[element] == sign) ||
        rowIndexes.every((element) => signs[element] == sign) ||
        [0, 4, 8].every((element) => signs[element] == sign) ||
        [2, 4, 6].every((element) => signs[element] == sign)) {
      Dialogue.communicateEndGame(context, restart);
    }
    return;
  }

  int decMosse() {
    if (--_mosse == 0) {
      Dialogue.communicateEndGame(context, restart);
    }
    return _mosse;
  }

  void restart() {
    squares = [
      Square(sides: const [2, 3]),
      Square(sides: const [2, 3]),
      Square(sides: const [2]),
      Square(sides: const [2, 3]),
      Square(sides: const [2, 3]),
      Square(sides: const [2]),
      Square(sides: const [3]),
      Square(sides: const [3]),
      Square(sides: const [])
    ];
    signs = [
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
    _mosse = 9;
    swapTurn();
    notifyListeners();
  }

  int getMosse() => _mosse;

  BaseSquare getNewSquare(BaseSquare square) =>
      turns[0].getSquareFromTurn(square.sides);

  void swapTurn() {
    Turn tmp = turns[0];
    turns[0] = turns[1];
    turns[1] = tmp;
    return;
  }
}
