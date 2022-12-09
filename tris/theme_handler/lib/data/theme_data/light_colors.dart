// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:theme_handler/data/theme_data/base_colors.dart';

class LightColors extends BaseColors {
  late Color light;

  LightColors(
    super.primary,
    super.splash,
    this.light,
  );

  factory LightColors.fromJson(Map<String, List<dynamic>> json) {
    final List<int> primary = List<int>.from(json["primary"]!);
    final List<int> splash = List<int>.from(json["splash"]!);
    final List<int> light = List<int>.from(json["light"]!);

    return LightColors(
        Color.fromARGB(primary[0], primary[1], primary[2], primary[3]),
        Color.fromARGB(splash[0], splash[1], splash[2], splash[3]),
        Color.fromARGB(light[0], light[1], light[2], light[3]));
  }

  @override
  String toString() {
    return " ${super.toString()} + ${light.toString()}";
  }

  @override
  ThemeData makeTheme() => ThemeData(
      primaryColor: super.primary,
      splashColor: super.splash,
      primaryColorLight: light);
}
