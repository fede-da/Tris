import 'package:flutter/material.dart';

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
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            left: sides.contains(0)
                ? const BorderSide(color: Colors.deepOrange, width: 3)
                : const BorderSide(),
            top: sides.contains(1)
                ? const BorderSide(color: Colors.deepOrange, width: 3)
                : const BorderSide(),
            right: sides.contains(2)
                ? const BorderSide(color: Colors.deepOrange, width: 3)
                : const BorderSide(),
            bottom: sides.contains(3)
                ? const BorderSide(color: Colors.deepOrange, width: 3)
                : const BorderSide(),
          )),
    );
  }
}
