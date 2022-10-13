import 'package:flutter/material.dart';

extension KeyPainting on GlobalKey {
  Offset get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return Offset(translation.x, translation.y);
    } else {
      print("Offset 0,0 ");
      return const Offset(0, 0);
    }
  }
}
