library theme_handler;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme_handler/data/reader/color_reader.dart';
import 'package:theme_handler/data/theme_data/dark_colors.dart';
import 'package:theme_handler/data/theme_data/light_colors.dart';

class ThemeDataHolder {
  late final ThemeData _lightTheme;
  late final ThemeData _darkTheme;
  late final ColorReader _cr;

  ThemeDataHolder() {
    // _lightTheme = ThemeData(
    //     primaryColor: Colors.grey[200],
    //     splashColor: Colors.deepOrange,
    //     primaryColorLight: Colors.amber);
    // _darkTheme = ThemeData(
    //     primaryColor: Colors.blueGrey[900],
    //     splashColor: Colors.deepOrange,
    //     primaryColorDark: Colors.teal[900]);
    getThemesFromAssets();
    _lightTheme = _cr.getLightColors().makeTheme();
    _darkTheme = _cr.getDarkColors().makeTheme();
  }

  ThemeData getLightTheme() => _lightTheme;
  ThemeData getDarkTheme() => _darkTheme;

  void getThemesFromAssets() async {
    try {
      print("Trying to read assets");
      String jsonString =
          await rootBundle.loadString('assets/confs/application_colors.json');
      _cr = ColorReader(jsonColors: jsonString);
      Map<String, dynamic> result = jsonDecode(jsonString);
      print(result);
      print(result["dark"].runtimeType);
      print(result["dark"]["primary"].runtimeType);
      print("Light colors are: ");
      final LightColors _lc = _cr.getLightColors();
      // LightColors.fromJson(
      //     Map<String, List<dynamic>>.from(result["light"]));
      print(_lc);
      print("Black colors are: ");
      final DarkColors _dc = _cr.getDarkColors();
      //DarkColors.fromJson(Map<String, List<dynamic>>.from(result["dark"]));
      print(_dc);
    } catch (e) {
      print(e);
      print("Color asset not found");
    }
  }

  void getLightThemeFromAssets() {}
}
