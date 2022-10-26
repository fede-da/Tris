library theme_handler;

import 'package:flutter/material.dart';

class ThemeDataHolder {
  ThemeDataHolder() {
    _lightTheme = ThemeData(
        primaryColor: Colors.grey[200], splashColor: Colors.deepOrange);
    _darkTheme = ThemeData(
        primaryColor: Colors.blueGrey[900], splashColor: Colors.deepOrange);
  }

  late final ThemeData _lightTheme;
  late final ThemeData _darkTheme;

  ThemeData getLightTheme() => _lightTheme;
  ThemeData getDarkTheme() => _darkTheme;
}
