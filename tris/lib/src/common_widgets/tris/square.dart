import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/common_widgets/tris/base_square.dart';
import 'package:tris/src/handler/tris_handler.dart';
import 'package:tris/src/utils/my_painter.dart';

class Square extends BaseSquare {
  /*side defines which border will be underlined:
  0 -> left
  1 -> top
  2 -> rigth
  3 -> bottom
  */

  Square({super.key, required super.sides}) {
    squareId = id;
    id++;
    id = id % 9;
  }
  static int id = 0;
  late final int squareId;

  int getSquareId() => squareId;

  int getId() => squareId;

  @override
  Widget build(BuildContext context) {
    void tapped() {
      Provider.of<TrisHandler>(context, listen: false)
          .squareTappedAtIndex(getId());
      return print(getId());
    }

    Color customColor = Theme.of(context).splashColor;
    Color defaultColor = Colors.transparent;
    BorderSide customBorder = BorderSide(color: customColor, width: 3);
    BorderSide defaultBorder = BorderSide(color: defaultColor, width: 3);

    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => tapped(),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                left: sides.contains(0) ? customBorder : defaultBorder,
                top: sides.contains(1) ? customBorder : defaultBorder,
                right: sides.contains(2) ? customBorder : defaultBorder,
                bottom: sides.contains(3) ? customBorder : defaultBorder,
              )),
          child: Center(
              child: Container(
            child:
                CustomPaint(painter: context.read<TrisHandler>().getPainter()),
          )),
        ),
      ),
    );
  }
}
