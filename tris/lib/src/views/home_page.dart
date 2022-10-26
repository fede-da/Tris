import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/common_widgets/custom_button.dart';
import 'package:tris/src/utils/sizer.dart';

import '../common_widgets/spacer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HomePageItems(),
    );
  }
}

class HomePageItems extends StatelessWidget {
  const HomePageItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(pageToVisit: '/NewGame', buttonText: "NewGame"),
            const MySpacer(),
            CustomButton(pageToVisit: '/Settings', buttonText: "Settings"),
            const MySpacer(),
            CustomButton(pageToVisit: '/Statistics', buttonText: "Statistics"),
            const MySpacer(),
            CustomButton(pageToVisit: '/Credits', buttonText: "Credits"),
          ],
        ),
      ),
    );
  }
}
