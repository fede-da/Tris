import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/views/tris_view.dart';
import 'package:tris/src/ui_components/tris/tris_ui.dart';
import 'package:tris/src/utils/cross_painter.dart';
import 'package:tris/src/utils/sizer.dart';

import '../common_widgets/tris/square.dart';
import '../handler/tris_handler.dart';

class Tris extends StatelessWidget {
  const Tris({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Sizer(
        width: MediaQuery.of(context).size.width * 0.7,
        heigth: MediaQuery.of(context).size.height * 0.7,
      ),
      builder: ((context, child) => SizedBox(
            width: context.read<Sizer>().getTrisWidth(),
            child: ChangeNotifierProvider<TrisUI>(
              create: (newContext) => TrisUI(context: context),
              child: const TrisView(),
            ),
          )),
    );
  }
}
