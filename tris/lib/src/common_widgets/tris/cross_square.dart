import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tris/src/common_widgets/tris/base_square.dart';
import 'package:tris/src/common_widgets/tris/signs.dart';
import 'package:tris/src/common_widgets/tris/square.dart';

class CrossSquare extends BaseSquare {
  const CrossSquare(
      {super.key, required super.sides, super.sign = Signs.cross});

  @override
  Widget build(BuildContext context) {
    Color customColor = Theme.of(context).splashColor;
    Color defaultColor = Colors.transparent;
    BorderSide customBorder = BorderSide(color: customColor, width: 3);
    BorderSide defaultBorder = BorderSide(color: defaultColor, width: 3);

    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.redAccent[700],
            border: Border(
              left: sides.contains(0) ? customBorder : defaultBorder,
              top: sides.contains(1) ? customBorder : defaultBorder,
              right: sides.contains(2) ? customBorder : defaultBorder,
              bottom: sides.contains(3) ? customBorder : defaultBorder,
            )),
        child: Center(
          child: Container(
              // child:
              //     CustomPaint(painter: context.read<TrisHandler>().getPainter()),
              ),
        ),
      ),
    );
  }
}
