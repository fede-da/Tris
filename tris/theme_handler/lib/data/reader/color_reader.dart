import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:theme_handler/data/theme_data/dark_colors.dart';

import '../theme_data/light_colors.dart';

class ColorReader {
  late Map<String, dynamic> _colorsFromAsset;
  late String jsonColors;

  ColorReader({required this.jsonColors}) {
    _colorsFromAsset = jsonDecode(jsonColors);
  }
  DarkColors getDarkColors() => DarkColors.fromJson(
      Map<String, List<dynamic>>.from(_colorsFromAsset["dark"]));

  LightColors getLightColors() => LightColors.fromJson(
      Map<String, List<dynamic>>.from(_colorsFromAsset["light"]));
}
