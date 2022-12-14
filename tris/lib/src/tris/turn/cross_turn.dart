import 'package:flutter/material.dart';
import 'package:tris/src/common_widgets/tris/signs.dart';
import 'package:tris/src/tris/turn/turn.dart';

import '../../common_widgets/tris/base_square.dart';
import '../../common_widgets/tris/cross_square.dart';
import '../../common_widgets/tris/square.dart';

class CrossTurn implements Turn {
  @override
  BaseSquare getSquareFromTurn(List<int> sides) {
    return CrossSquare(
      sides: sides,
    );
  }

  @override
  Signs getSign() => Signs.cross;

  @override
  String toString() {
    // TODO: implement toString
    return "This square has sign : ${getSign()}";
  }
}
