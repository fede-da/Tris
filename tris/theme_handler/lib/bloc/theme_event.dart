part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class LightThemeRequested extends ThemeEvent {}

class DarkThemeRequested extends ThemeEvent {}
