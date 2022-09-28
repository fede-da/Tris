import 'package:flutter/material.dart';
import 'package:tris/src/utils/my_painter.dart';

class TrisHandler extends ChangeNotifier {
  TrisHandler({required this.length}) : super() {
    painter = MyPainter(length: length);
  }
  final double length;
  late MyPainter painter;

  List<Signs> signs = [
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
  ];

  //index -> 0 to index - 1
  void changeSignAt(int index, Signs sign) {
    signs[index] = sign;
    notifyListeners();
    return;
  }

  MyPainter getPainter() => painter;
}

enum Signs { empty, circle, cross }

class EmptySign {
  Enum sign = Signs.empty;

  void drawCircle() {}

  void drawSquare() {}
}
