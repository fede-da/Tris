import 'package:tris/src/handler/ia_handler.dart';
import 'package:tris/src/ui_components/tris/tris_ui.dart';

class TrisIA extends TrisUI {
  TrisIA({required super.context}) {
    super.handler = IAHandler();
  }

  @override
  void iaMakesMove(void Function(int p1) f) {
    return handler.move(f);
  }
}
