import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/views/tris_ia_view.dart';

import '../ui_components/tris/tris_ia.dart';
import '../utils/sizer.dart';

class TrisIAGame extends StatelessWidget {
  const TrisIAGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Sizer(
        width: MediaQuery.of(context).size.width * 0.7,
        heigth: MediaQuery.of(context).size.height * 0.7,
      ),
      builder: ((context, child) => SizedBox(
            width: context.read<Sizer>().getTrisWidth(),
            child: ChangeNotifierProvider<TrisIA>(
              create: (newContext) => TrisIA(context: context),
              child: const TrisViewIA(),
            ),
          )),
    );
  }
}
