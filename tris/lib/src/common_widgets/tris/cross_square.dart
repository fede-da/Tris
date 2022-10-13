import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/common_widgets/tris/base_square.dart';
import 'package:tris/src/common_widgets/tris/signs.dart';
import 'package:tris/src/common_widgets/tris/square.dart';
import 'package:tris/src/utils/cross_painter.dart';
import 'package:tris/src/utils/key_painting.dart';

import '../../utils/sizer.dart';

class CrossSquare extends BaseSquare {
  const CrossSquare({required super.sides, super.sign = Signs.cross});

  @override
  Widget build(BuildContext context) {
    final double size = (context.read<Sizer>().getSquareWidth()) / 4;
    Color customColor = Theme.of(context).splashColor;
    Color defaultColor = Colors.transparent;
    BorderSide customBorder = BorderSide(color: customColor, width: 3);
    BorderSide defaultBorder = BorderSide(color: defaultColor, width: 3);

    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: sides.contains(0) ? customBorder : defaultBorder,
          top: sides.contains(1) ? customBorder : defaultBorder,
          right: sides.contains(2) ? customBorder : defaultBorder,
          bottom: sides.contains(3) ? customBorder : defaultBorder,
        )),
        child: Center(
          child: CustomPaint(
            painter: CrossPainter(
                p1: Offset(-size, -size),
                p2: Offset(
                  size,
                  size,
                ),
                length: size),
          ),
        ),
      ),
    );
  }
}
