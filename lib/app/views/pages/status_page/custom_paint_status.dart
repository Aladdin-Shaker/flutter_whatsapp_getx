import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintStatus extends CustomPainter {
  final bool isViewd;
  final int statusNo;
  CustomPaintStatus(this.isViewd, this.statusNo);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      // ..strokeCap = StrokeCap.round
      ..color = isViewd ? Colors.grey : Colors.greenAccent
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    if (statusNo == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(0), degreeToAngle(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / statusNo;
      for (int i = 0; i < statusNo; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  double degreeToAngle(double degree) {
    return degree * pi / 180;
  }
}
