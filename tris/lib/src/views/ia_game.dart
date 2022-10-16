import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/tris/tris_ia_game.dart';
import 'package:tris/src/ui_components/tris/tris_ia.dart';
import '../common_widgets/scaffold_custom.dart';
import '../utils/sizer.dart';
import 'tris_ia_view.dart';

class IAGameView extends StatelessWidget {
  const IAGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      widget: TrisView(),
      title: "New Game",
      hasAppBar: true, //dovrebbe essere false
    );
  }
}

class TrisView extends StatelessWidget {
  const TrisView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: TrisIAGame());
  }
}
