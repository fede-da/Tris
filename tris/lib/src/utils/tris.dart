import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/common_widgets/tris/column.dart';
import 'package:tris/src/utils/my_painter.dart';

import '../common_widgets/tris/square.dart';
import '../handler/tris_handler.dart';

class Tris extends StatelessWidget {
  const Tris({super.key});

  @override
  Widget build(BuildContext context) {
    double length = MediaQuery.of(context).size.width * 0.25;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ChangeNotifierProvider<TrisHandler>(
          create: (_) => TrisHandler(length: length),
          child: const TrisColumn()),
    );
  }
}
