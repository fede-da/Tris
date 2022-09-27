import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tris/src/common_widgets/scaffold_custom.dart';

import '../common_widgets/custom_button.dart';
import '../common_widgets/spacer.dart';

class NewGamePage extends StatelessWidget {
  const NewGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(widget: NewGameItems(), title: "New Game");
  }
}

class NewGameItems extends StatelessWidget {
  const NewGameItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(pageToVisit: '/LocalGame', buttonText: "1 vs 1 local"),
          const MySpacer(),
          CustomButton(pageToVisit: '/IAGame', buttonText: "Play vs BOT"),
          const MySpacer(),
        ],
      ),
    );
  }
}
