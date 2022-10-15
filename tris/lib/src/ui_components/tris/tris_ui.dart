import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/dialogue.dart';
import '../../common_widgets/tris/base_square.dart';
import '../../common_widgets/tris/square.dart';

class TrisUI extends ChangeNotifier {
  TrisUI({required this.context}) : super();
  final BuildContext context;

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

  BaseSquare getSquareAt(int index) => squares[index];

  List<BaseSquare> get3RowsFromIndex(int index) => [
        squares[index],
        squares[index + 1],
        squares[index + 2],
      ];

  void squareTappedAtIndex(int index, BaseSquare newSquare) {
    squares[index] = newSquare;
    notifyListeners();
    return;
  }

  void reset() {
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
  }

  void communicateVictory() {
    Dialogue.communicateEndGame(context, reset);
    return;
  }

  void communicateEndGame() {
    Dialogue.communicateEndGame(context, reset);
  }
}
