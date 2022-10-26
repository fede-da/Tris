import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:theme_handler/data/theme_data_holder.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeDataHolder _td = ThemeDataHolder();
  late ThemeData _theme;

  ThemeBloc() : super(ThemeInitial()) {
    _theme = _td.getLightTheme();
    on<LightThemeRequested>((event, emit) {
      _theme = _td.getLightTheme();
      emit(LightThemeConfirmed());
    });
    on<DarkThemeRequested>((event, emit) {
      _theme = _td.getDarkTheme();
      emit(DarkThemeConfirmed());
    });
  }

  void switchToLightTheme() {
    return add(LightThemeRequested());
  }

  void switchToDarkTheme() {
    return add(DarkThemeRequested());
  }

  ThemeData get currentTheme => _theme;
}
