import 'package:flutter/material.dart';

class TrisHandler extends ChangeNotifier {
  List<Signs> signs = [
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
    Signs.empty,
  ];

  //index -> 0 to index - 1
  void changeSignAt(int index, Signs sign) {
    signs[index] = sign;
    notifyListeners();
    return;
  }
}

enum Signs { empty, circle, cross }
