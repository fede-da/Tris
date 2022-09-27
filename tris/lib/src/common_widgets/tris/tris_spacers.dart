import 'package:flutter/material.dart';

class HorizontalTrisSpacer extends StatelessWidget {
  const HorizontalTrisSpacer({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 5,
      color: Colors.red,
    );
  }
}

class VerticalTrisSpacer extends StatelessWidget {
  const VerticalTrisSpacer({Key? key, required this.heigth}) : super(key: key);
  final double heigth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: heigth,
      color: Colors.red,
    );
  }
}
