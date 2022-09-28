import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  MyPainter({required this.length}) : super();
  final double length;
  Offset _p1 = const Offset(0, 0);
  Offset _p2 = const Offset(0, 0);
  final Paint myPaint = Paint()..strokeWidth = 4;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(_p1, _p2, myPaint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }

  void drawCross(Offset newP1, Offset newP2) {
    _p1 = newP1;
    _p2 = newP2;
    myPaint.color = const Color.fromARGB(255, 150, 3, 3);
    return;
  }

  void drawCircle(Offset newP1, Offset newP2) {
    _p1 = newP1;
    _p2 = newP2;
    myPaint.color = const Color.fromARGB(255, 16, 124, 1);
    return;
  }
}
