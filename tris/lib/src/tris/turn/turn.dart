import 'package:flutter/material.dart';

import '../../common_widgets/tris/base_square.dart';
import '../../common_widgets/tris/signs.dart';
import '../../common_widgets/tris/square.dart';

abstract class Turn {
  BaseSquare getSquareFromTurn(List<int> sides);

  Signs getSign();
}
