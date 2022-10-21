import 'package:flutter/material.dart';
import 'package:tris/src/common_widgets/tris/turnMaster.dart';
import 'package:tris/src/tris/turn/circle_turn.dart';
import 'package:tris/src/tris/turn/cross_turn.dart';
import '../common_widgets/dialogue.dart';
import '../common_widgets/tris/base_square.dart';
import '../common_widgets/tris/signs.dart';
import '../common_widgets/tris/square.dart';
import '../tris/turn/turn.dart';
import '../ui_components/tris/tris_ui.dart';

class TrisHandler {
  TurnMaster tm = TurnMaster();
  int _mosse = 9;
  int latestChoice = 0;
  bool iaCanMove = true;
  bool iaMovesFirst = false;
  List<int> diag1 = const [0, 4, 8];
  List<int> diag2 = const [2, 4, 6];

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

  BaseSquare getSquareAt(List<int> sides) => tm.getCurrentTurnSquare(sides);

  bool isEmptyAt(int index) => signs[index] == Signs.empty;

  void updateSign(int index, Signs sign) {
    signs[index] = sign;
    return;
  }

  void setChoice(int index) {
    latestChoice = index;
    return;
  }

  void swapFirstMoving() {
    iaMovesFirst = !iaMovesFirst;
    return;
  }

  int getLatestChoice() => latestChoice;

  bool canMove() => iaCanMove;

  void abilitateMove() {
    print("Now ia can move");
    iaCanMove = true;
    return;
  }

  bool checkWin(int index, Signs sign) {
    List<int> columnIndexes = getColumnIndexes(index);
    List<int> rowIndexes = getRowIndexes(index);
    //checks tris on row, column and diagonal lines
    if (isTris(rowIndexes, columnIndexes, sign)) {
      _mosse++;
      return true;
    }
    return false;
  }

  bool isTris(List<int> rowIndexes, List<int> columnIndexes, Signs sign) {
    return isTrisOn(columnIndexes, sign) ||
        isTrisOn(rowIndexes, sign) ||
        isTrisOn(diag1, sign) ||
        isTrisOn(diag2, sign);
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
    latestChoice = -1;
    _mosse = 9;
    tm.restart();
    cleanIa();
  }

  void cleanIa() {}

  int getMosse() => _mosse;

  BaseSquare getNewSquare(BaseSquare square, int index) {
    final ret = tm.getCurrentTurnSquare(square.sides);
    return ret;
  }

  void move(void Function(int) f) {}

  void swapTurn() {
    tm.swapTurn();
    return;
  }
}
