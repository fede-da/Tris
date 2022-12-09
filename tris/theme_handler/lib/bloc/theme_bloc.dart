import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:theme_handler/data/theme_data_holder.dart';

import '../data/reader/color_reader.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  //final ThemeDataHolder _td = ThemeDataHolder();
  late ThemeData _theme;
  late final ColorReader _cr;

  ThemeBloc() : super(ThemeInitial()) {
    _theme = ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        splashColor: Colors.deepPurpleAccent,
        primaryColorLight: Colors.amber);
    readColors();
    on<ThemeInitializing>((event, emit) {
      _theme = _cr.getLightColors().makeTheme();
      emit(ThemeInitialTerminated());
    });
    on<LightThemeRequested>((event, emit) {
      _theme = _cr.getLightColors().makeTheme();
      emit(LightThemeConfirmed());
    });
    on<DarkThemeRequested>((event, emit) {
      _theme = _cr.getDarkColors().makeTheme();
      emit(DarkThemeConfirmed());
    });
  }

  void readColors() async {
    _cr = ColorReader(jsonColors: await readColorsStringFromAsset());
    switchToLightTheme();
  }

  Future<String> readColorsStringFromAsset() async =>
      await rootBundle.loadString('assets/confs/application_colors.json');

  void switchToLightTheme() {
    return add(LightThemeRequested());
  }

  void switchToDarkTheme() {
    return add(DarkThemeRequested());
  }

  void reload() => readColors();

  ThemeData get currentTheme => _theme;
}
