import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../../handler/tris_handler.dart';
import '../../ui_components/tris/tris_ui.dart';
import '../../utils/sizer.dart';
import 'base_square.dart';
import 'square.dart';

/*

TrisHandler deve essere fornito a TrisUI tramite provider e sarà
il TrisUI a comunicargli di aver ricevuto un tap su schermo.
Il conusmer di tripo TrisHandler in Column deve essere sostituito con
un consumer di tipo TrisUI altrimenti la grafica non si aggiorna

 */

class TrisView extends StatelessWidget {
  const TrisView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<Sizer>().getTrisHeigth(),
      width: context.read<Sizer>().getTrisWidth(),
      child: Consumer<TrisHandler>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: TrisColumn(
                  squaresList: value.getTrisUI().get3RowsFromIndex(0),
                ),
              ),
              Expanded(
                flex: 1,
                child: TrisColumn(
                  squaresList: value.getTrisUI().get3RowsFromIndex(3),
                ),
              ),
              Expanded(
                flex: 1,
                child: TrisColumn(
                  squaresList: value.getTrisUI().get3RowsFromIndex(6),
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
