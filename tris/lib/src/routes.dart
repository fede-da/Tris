import 'package:flutter/material.dart';
import 'package:tris/src/views/credits.dart';
import 'package:tris/src/views/home_page.dart';
import 'package:tris/src/views/ia_game.dart';
import 'package:tris/src/views/local_game.dart';
import 'package:tris/src/views/new_game.dart';
import 'package:tris/src/views/statistics.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/Home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/NewGame':
        return MaterialPageRoute(builder: (_) => const NewGamePage());
      case '/Statistics':
        return MaterialPageRoute(builder: (_) => const StatisticsPage());
      case '/Credits':
        return MaterialPageRoute(builder: (_) => CreditsPage());
      case '/LocalGame':
        return MaterialPageRoute(builder: (_) => const LocalGameView());
      case '/IAGame':
        return MaterialPageRoute(builder: (_) => const IAGameView());
      default:
        return MaterialPageRoute(
          builder: (_) => Container(),
        );
    }
  }
}
