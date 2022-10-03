import 'package:flutter/material.dart';

class Sizer {
  Sizer({Key? key, required this.width, required this.heigth}) {
    if (width >= heigth) {
      trisWidth = heigth;
    } else {
      trisWidth = width;
    }
    squareWidth = trisWidth * 0.33;
  }

  late final double width;
  late final double heigth;
  late final double squareWidth;
  late final double trisWidth;

  double getTrisWidth() => trisWidth;

  double getTrisHeigth() => heigth;

  double getSquareWidth() => squareWidth;
}
