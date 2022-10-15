import 'package:flutter/material.dart';
import 'package:tris/src/tris/turn/circle_turn.dart';
import 'package:tris/src/tris/turn/cross_turn.dart';
import '../common_widgets/dialogue.dart';
import '../common_widgets/tris/base_square.dart';
import '../common_widgets/tris/signs.dart';
import '../common_widgets/tris/square.dart';
import '../tris/turn/turn.dart';
import '../ui_components/tris/tris_ui.dart';

class TrisHandler {
  List<Turn> turns = [CrossTurn(), CircleTurn()];
  int _mosse = 9;

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

  BaseSquare getSquareAt(int index, List<int> sides) =>
      turns[0].getSquareFromTurn(sides);

  void updateSign(int index, Signs sign) {
    signs[index] = sign;
    return;
  }

  bool checkWin(int index, Signs sign) {
    int elemNumber = index;
    int columnIndex = (elemNumber ~/ 3) * 3;
    List<int> columnIndexes = [columnIndex, columnIndex + 1, columnIndex + 2];
    int rowIndex = elemNumber % 3;
    List<int> rowIndexes = [rowIndex, rowIndex + 3, rowIndex + 6];
    if (columnIndexes.every((element) => signs[element] == sign) ||
        rowIndexes.every((element) => signs[element] == sign) ||
        [0, 4, 8].every((element) => signs[element] == sign) ||
        [2, 4, 6].every((element) => signs[element] == sign)) {
      restart();
      _mosse++;
      return true;
    }
    return false;
  }

  int decMosse() {
    swapTurn();
    return --_mosse;
  }

  void restart() {
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
  }

  int getMosse() => _mosse;

  BaseSquare getNewSquare(BaseSquare square, int index) {
    final ret = turns[0].getSquareFromTurn(square.sides);
    return ret;
  }

  void swapTurn() {
    Turn tmp = turns[0];
    turns[0] = turns[1];
    turns[1] = tmp;
    return;
  }
}
