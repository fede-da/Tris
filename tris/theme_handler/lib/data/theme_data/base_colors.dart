import 'package:flutter/material.dart';

abstract class BaseColors {
  Color primary = Colors.purpleAccent;
  Color splash = Colors.deepPurpleAccent;
  BaseColors(this.primary, this.splash);

  ThemeData makeTheme();

  @override
  String toString() {
    return " Colors: $primary + $splash ";
  }
}
