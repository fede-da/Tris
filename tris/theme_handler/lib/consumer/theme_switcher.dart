import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../bloc/theme_bloc.dart';

class ThemeSwitcher {
  final BuildContext context;

  ThemeSwitcher({required this.context});

  void switchToLight() => context.read<ThemeBloc>().switchToLightTheme();

  void switchToDark() => context.read<ThemeBloc>().switchToDarkTheme();
}
