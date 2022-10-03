import 'package:flutter/src/widgets/framework.dart';
import 'package:tris/src/common_widgets/tris/circle_square.dart';
import 'package:tris/src/tris/turn/turn.dart';

import '../../common_widgets/tris/base_square.dart';
import '../../common_widgets/tris/square.dart';

class CircleTurn implements Turn {
  @override
  BaseSquare getSquareFromTurn(List<int> sides) {
    return CircleSquare(
      sides: sides,
    );
  }
}
