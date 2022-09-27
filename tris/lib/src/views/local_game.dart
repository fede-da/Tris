import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tris/src/common_widgets/scaffold_custom.dart';
import 'package:tris/src/utils/tris.dart';

class LocalGameView extends StatelessWidget {
  const LocalGameView({super.key});

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
    return const Center(child: Tris());
  }
}
