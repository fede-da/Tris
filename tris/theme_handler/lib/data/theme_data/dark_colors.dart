// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:theme_handler/data/theme_data/base_colors.dart';

class DarkColors extends BaseColors {
  late Color dark;

  DarkColors(
    super.primary,
    super.splash,
    this.dark,
  );

  factory DarkColors.fromJson(Map<String, List<dynamic>> json) {
    final List<int> primary = List<int>.from(json["primary"]!);
    final List<int> splash = List<int>.from(json["splash"]!);
    final List<int> dark = List<int>.from(json["dark"]!);

    return DarkColors(
      Color.fromARGB(primary[0], primary[1], primary[2], primary[3]),
      Color.fromARGB(splash[0], splash[1], splash[2], splash[3]),
      Color.fromARGB(dark[0], dark[1], dark[2], dark[3]),
    );
  }

  @override
  String toString() {
    return " ${super.toString()} + ${dark.toString()}";
  }

  @override
  ThemeData makeTheme() => ThemeData(
        primaryColor: super.primary,
        splashColor: super.splash,
        primaryColorLight: dark,
      );
}
