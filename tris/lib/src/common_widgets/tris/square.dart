import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/handler/tris_handler.dart';
import 'package:tris/src/utils/my_painter.dart';

class Square extends StatelessWidget {
  /*side defines which border will be underlined:
  0 -> left
  1 -> top
  2 -> rigth
  3 -> bottom
  */
  const Square({Key? key, required this.width, required this.sides})
      : super(key: key);
  final double width;
  final List<int> sides;

  @override
  Widget build(BuildContext context) {
    Color customColor = Theme.of(context).splashColor;
    Color defaultColor = Theme.of(context).primaryColor;
    BorderSide customBorder = BorderSide(color: customColor, width: 3);
    BorderSide defaultBorder = BorderSide(color: defaultColor, width: 3);

    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          border: Border(
        left: sides.contains(0) ? customBorder : defaultBorder,
        top: sides.contains(1) ? customBorder : defaultBorder,
        right: sides.contains(2) ? customBorder : defaultBorder,
        bottom: sides.contains(3) ? customBorder : defaultBorder,
      )),
      child: Center(
          child: Container(
        child: CustomPaint(painter: context.read<TrisHandler>().getPainter()),
      )),
    );
  }
}
