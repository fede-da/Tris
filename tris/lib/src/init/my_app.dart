import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_handler/bloc/theme_bloc.dart';
import 'package:tris/src/routes.dart';
import 'package:tris/src/views/home_page.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      buildWhen: (previousState, state) =>
          previousState.runtimeType != state.runtimeType,
      builder: (BuildContext context, state) {
        return MaterialApp(
          theme: context.read<ThemeBloc>().currentTheme,
          home: const SafeArea(
            child: HomePage(),
          ),
          onGenerateRoute: _appRouter.onGeneratedRoute,
        );
      },
    );
  }
}
