import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tris/src/common_widgets/tris/circle_square.dart';
import 'package:tris/src/common_widgets/tris/cross_square.dart';

class CreditsPage extends StatelessWidget {
  CreditsPage({super.key});
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                CircleSquare(sides: const [0, 1, 2, 3]),
                CircleSquare(sides: const [0, 1, 2, 3]),
                CircleSquare(
                  sides: const [0, 1, 2, 3],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
