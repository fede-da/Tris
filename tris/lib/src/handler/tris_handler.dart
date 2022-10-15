import 'package:flutter/material.dart';
import 'package:tris/src/tris/turn/circle_turn.dart';
import 'package:tris/src/tris/turn/cross_turn.dart';
import '../common_widgets/dialogue.dart';
import '../common_widgets/tris/base_square.dart';
import '../common_widgets/tris/signs.dart';
import '../common_widgets/tris/square.dart';
import '../tris/turn/turn.dart';
import '../ui_components/tris/tris_ui.dart';

class TrisHandler extends ChangeNotifier {
  List<Turn> turns = [CrossTurn(), CircleTurn()];
  int _mosse = 9;
  TrisUI trisUI;

  TrisHandler({required this.trisUI}) : super();

  TrisUI getTrisUI() => trisUI;

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

  void squareTappedAtIndex(int index) {
    BaseSquare s = trisUI.getSquareAt(index);
    BaseSquare newSquare = getNewSquare(s, index);
    trisUI.squareTappedAtIndex(index, newSquare);
    notifyListeners();
    signs[index] = newSquare.sign;
    checkWin(index, newSquare.sign);
    decMosse();
    swapTurn();
    return;
  }

  void checkWin(int index, Signs sign) {
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
      trisUI.communicateVictory();
      _mosse++;
      return;
    }
    return;
  }

  void decMosse() {
    if (--_mosse == 0) {
      restart();
      trisUI.communicateEndGame();
      return;
    }
    return;
  }

  void restart() {
    trisUI.reset();
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
    notifyListeners();
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
