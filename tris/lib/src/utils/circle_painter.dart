import 'package:flutter/material.dart';

//Vedi come funziona la libreria CustomPainter : https://api.flutter.dev/flutter/widgets/CustomPaint-class.html

class CirclePainter extends CustomPainter {
  CirclePainter({required this.p, required this.length}) : super() {
    myPaint.color = const Color.fromARGB(255, 118, 255, 3);
  }
  final double length;

  //p1 il punto sullo schermo di inizio della funzione paint (disegna linea)
  final Offset p;

  //myPaint contiene le informazioni relative a colore,
  //larghezza del tratto...
  final Paint myPaint = Paint()
    ..strokeWidth = 6
    ..style = PaintingStyle.stroke
    ..color = const Color.fromARGB(255, 213, 1, 1);

  //Prende in input due offset (coordinate) e disegna una x
  @override
  void paint(Canvas canvas, Size size) {
    //NB quando incrementiamo o diminuiamo x ed y ci muoviamo al contrario
    //rispetto agli assi cartesiani tradizionali. Ad es y + 10 non si trova
    //più in alto ma più in basso
    canvas.drawCircle(p, length, myPaint);
  }

  //Non ho capito ma non dovrebbe essere importante al momento
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
