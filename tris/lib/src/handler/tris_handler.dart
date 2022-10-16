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
  bool iaCanMove = true;
  int latestChoice = 0;
  bool hostMovesFirst = true;

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

  void setChoice(int index) {
    latestChoice = index;
    return;
  }

  void swapFirstMoving() {
    hostMovesFirst = !hostMovesFirst;
    return;
  }

  int getLatestChoice() => latestChoice;

  bool canMove() => iaCanMove;

  void abilitateMove() {
    iaCanMove = true;
    return;
  }

  bool checkWin(int index, Signs sign) {
    List<int> columnIndexes = getColumnIndexes(index);
    List<int> rowIndexes = getRowIndexes(index);
    //checks tris on row, column and diagonal lines
    if (isTris(rowIndexes, columnIndexes, sign)) {
      restart();
      _mosse++;
      return true;
    }
    return false;
  }

  bool isTris(List<int> rowIndexes, List<int> columnIndexes, Signs sign) {
    return isTrisOn(columnIndexes, sign) ||
        isTrisOn(rowIndexes, sign) ||
        isTrisOn([0, 4, 8], sign) ||
        isTrisOn([2, 4, 6], sign);
  }

  bool isTrisOn(List<int> toCheck, Signs sign) {
    return toCheck.every((element) => signs[element] == sign);
  }

  // gets all the elements inside the column that holds index
  List<int> getColumnIndexes(int index) {
    int columnIndex = (index ~/ 3) * 3;
    return [columnIndex, columnIndex + 1, columnIndex + 2];
  }

  // gets all the elements inside the row that holds index
  List<int> getRowIndexes(int index) {
    int rowIndex = index % 3;
    return [rowIndex, rowIndex + 3, rowIndex + 6];
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
    iaCanMove = true;
    latestChoice = 0;
    _mosse = 9;
    swapFirstMoving();
  }

  int getMosse() => _mosse;

  BaseSquare getNewSquare(BaseSquare square, int index) {
    final ret = turns[0].getSquareFromTurn(square.sides);
    return ret;
  }

  void move(void Function(int) f) {}

  void swapTurn() {
    Turn tmp = turns[0];
    turns[0] = turns[1];
    turns[1] = tmp;
    return;
  }
}
