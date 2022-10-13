import 'package:flutter/material.dart';
import 'package:tris/src/common_widgets/tris/signs.dart';
import 'package:tris/src/utils/key_painting.dart';

class BaseSquare extends StatelessWidget {
  const BaseSquare({super.key, required this.sides, this.sign = Signs.empty})
      : super();

  final List<int> sides;
  final Signs sign;

  Key getKey() => key!;

  get signValue => sign;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
