import 'package:flutter/material.dart';
import 'package:tris/src/routes.dart';
import 'package:tris/src/views/home_page.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 238, 237, 237),
        splashColor: Colors.deepOrange,
      ),
      home: const SafeArea(
        child: HomePage(),
      ),
      onGenerateRoute: _appRouter.onGeneratedRoute,
    );
  }
}
