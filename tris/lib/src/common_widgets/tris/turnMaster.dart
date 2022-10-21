import 'package:tris/src/common_widgets/tris/base_square.dart';

import '../../tris/turn/circle_turn.dart';
import '../../tris/turn/cross_turn.dart';
import '../../tris/turn/turn.dart';

class TurnMaster {
  TurnMaster() {
    _turns = [CrossTurn(), CircleTurn()];
    _firstPlayer = _turns[0];
    _secondPlayer = _turns[1];
    print(this);
  }

  int restared = 0;
  late List<Turn> _turns;
  late Turn _firstPlayer;
  late Turn _secondPlayer;

  void swapTurn() => _turns = _turns.reversed.toList();

  Turn getFirstPlayer() => _firstPlayer;

  Turn getSecondPlayer() => _secondPlayer;

  Turn getCurrentTurn() => _turns.first;

  BaseSquare getCurrentTurnSquare(List<int> sides) =>
      getCurrentTurn().getSquareFromTurn(sides);

  @override
  String toString() {
    return "1st turn is : ${_turns[0]} , 2nd turn is : ${_turns[1]}";
  }

  void restart() {
    print("Turn master restarted : $restared before increment");
    restared++;
    print(this);
    swapTurn();
    _firstPlayer = _turns[0];
    _secondPlayer = _turns[1];
    print("After swap turns are: ");
    print(this);
    print("Turn master restarted : $restared after increment");
    return;
  }
}
