import 'package:flutter/material.dart';
import 'package:tris/src/common_widgets/tris/signs.dart';

class BaseSquare extends StatelessWidget {
  const BaseSquare({Key? key, required this.sides, this.sign = Signs.empty})
      : super(key: key);

  final List<int> sides;
  final Signs sign;

  get signValue => sign;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
