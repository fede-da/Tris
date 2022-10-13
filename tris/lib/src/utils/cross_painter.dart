import 'dart:ui';

import 'package:flutter/material.dart';

//Vedi come funziona la libreria CustomPainter : https://api.flutter.dev/flutter/widgets/CustomPaint-class.html

class CrossPainter extends CustomPainter {
  CrossPainter({required this.p1, required this.p2, required this.length})
      : super();
  final double length;

  //p1 il punto sullo schermo di inizio della funzione paint (disegna linea)
  final Offset p1;
  //p2 punto di fine sullo schermo della funzione paint
  final Offset p2;
  //myPaint contiene le informazioni relative a colore,
  //larghezza del tratto...
  final Paint myPaint = Paint()
    ..strokeWidth = 12
    ..color = const Color.fromARGB(255, 213, 1, 1);

  //Prende in input due offset (coordinate) e disegna una x
  @override
  void paint(Canvas canvas, Size size) {
    //NB quando incrementiamo o diminuiamo x ed y ci muoviamo al contrario
    //rispetto agli assi cartesiani tradizionali. Ad es y + 10 non si trova
    //più in alto ma più in basso
    canvas.drawLine(p1, p2, myPaint);
    canvas.drawLine(Offset(p1.dx, p1.dy.abs()), Offset(p2.dx, -p2.dy), myPaint);
  }

  //Non ho capito ma non dovrebbe essere importante al momento
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
