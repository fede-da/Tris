import 'package:flutter/material.dart';
import 'package:tris/src/handler/tris_handler.dart';

import '../../common_widgets/dialogue.dart';
import '../../common_widgets/tris/base_square.dart';
import '../../common_widgets/tris/square.dart';

class TrisBase extends ChangeNotifier {
  TrisBase({required this.context}) : super();
  final BuildContext context;
  TrisHandler handler = TrisHandler();

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

  bool iaCanMove() => handler.canMove();

  void squareTappedAtIndex(int index) {
    handler.setChoice(index);
    BaseSquare newSquare = handler.getSquareAt(squares[index].sides);
    squares[index] = newSquare;
    notifyListeners();
    handler.updateSign(index, newSquare.sign);
    if (handler.checkWin(index, newSquare.sign)) {
      return communicateVictory();
    } else if (handler.decMosse() == 0) {
      return communicateEndGame();
    }
    handler.swapTurn();
    if (iaCanMove()) {
      handler.move(squareTappedAtIndex);
    } else {
      handler.abilitateMove();
      return;
    }
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
    handler.restart();
    notifyListeners();
    iaMakesMove(squareTappedAtIndex);
    notifyListeners();
    return;
  }

  void iaMakesMove(void Function(int) f) {}

  void communicateVictory() {
    print("communicate victory called");
    Dialogue.communicateEndGame(context, reset);
    notifyListeners();
    return;
  }

  void communicateEndGame() {
    print("communicate end-game called");
    Dialogue.communicateEndGame(context, reset);
    notifyListeners();
    return;
  }
}
