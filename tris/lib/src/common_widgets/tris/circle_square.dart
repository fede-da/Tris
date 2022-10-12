import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tris/src/common_widgets/tris/base_square.dart';
import 'package:tris/src/common_widgets/tris/signs.dart';
import 'package:tris/src/common_widgets/tris/square.dart';

// class CircleSquare extends StatelessWidget {
//   CircleSquare._(this.id, this.sides);
//   final int id;
//   List<int> sides = [];

//   static CircleSquare copyWith(Square square) =>
//       CircleSquare._(square.getId(), square.sides);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 1,
//       child: Container(
//         color: Colors.green,
//       ),
//     );
//   }
// }

class CircleSquare extends BaseSquare {
  const CircleSquare(
      {super.key, required super.sides, super.sign = Signs.circle});

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
            color: Colors.greenAccent[400],
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
