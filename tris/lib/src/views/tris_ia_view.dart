import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tris/src/common_widgets/tris/base_square.dart';
import 'package:tris/src/ui_components/tris/tris_ia.dart';

import '../utils/sizer.dart';

class TrisViewIA extends StatelessWidget {
  const TrisViewIA({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<Sizer>().getTrisHeigth(),
      width: context.read<Sizer>().getTrisWidth(),
      child: Consumer<TrisIA>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: TrisColumn(
                  squaresList: value.get3RowsFromIndex(0),
                ),
              ),
              Expanded(
                flex: 1,
                child: TrisColumn(
                  squaresList: value.get3RowsFromIndex(3),
                ),
              ),
              Expanded(
                flex: 1,
                child: TrisColumn(
                  squaresList: value.get3RowsFromIndex(6),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TrisColumn extends StatelessWidget {
  const TrisColumn({super.key, required this.squaresList});
  final List<BaseSquare> squaresList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: squaresList,
    );
  }
}
