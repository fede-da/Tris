import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/features/blocs/stats_bloc/stats_bloc.dart';
import 'package:tris/src/utils/cross_painter.dart';

import 'src/init/bloc_observer.dart';
import 'src/init/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const TrisGame()),
    blocObserver: MyBlocObserver(),
    storage: storage,
  );
}

class TrisGame extends StatelessWidget {
  const TrisGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StatsBloc>(
          create: (BuildContext context) => StatsBloc(),
        ),
      ],
      child: MyApp(),
    );
  }
}
