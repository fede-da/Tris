import 'package:flutter/material.dart';

//Vedi come funziona la libreria CustomPainter : https://api.flutter.dev/flutter/widgets/CustomPaint-class.html

class MyPainter extends CustomPainter {
  MyPainter({required this.length}) : super();
  final double length;
  //p1 il punto sullo schermo di inizio della funzione paint (disegna linea)
  Offset _p1 = const Offset(0, 0);
  //p2 punto di fine sullo schermo della funzione paint
  Offset _p2 = const Offset(0, 0);
  //myPaint contiene le informazioni relative a colore,
  //larghezza del tratto...
  final Paint myPaint = Paint()..strokeWidth = 4;

  //Prende in input due offser (coordinate) e disegna
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(_p1, _p2, myPaint);
  }

  //Non ho capito
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }

  //Funzione che disegna una x (incompleta)
  void drawCross(Offset newP1, Offset newP2) {
    _p1 = newP1;
    _p2 = newP2;
    myPaint.color = const Color.fromARGB(255, 150, 3, 3);
    //paint(p1,p2,myPaint)
    //paint(p3,p4,myPaint) o ridefinisci p1 e p2
    return;
  }

  //Funzione che disegna un cerchio (incompleta)
  void drawCircle(Offset newP1, Offset newP2) {
    _p1 = newP1;
    _p2 = newP2;
    myPaint.color = const Color.fromARGB(255, 16, 124, 1);
    //canvas.drawCircle
    return;
  }
}
