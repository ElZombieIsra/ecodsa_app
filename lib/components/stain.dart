import 'dart:math' as math;

import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';

class Stain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomStain(),
    );
  }
}

class _CustomStain extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint
    paint.color = Style.primaryColor;
    // center of the canvas is (x,y) => (width/2, height/2)
    Offset center = Offset(size.width / 2, size.height / 2);

    Rect rect = Rect.fromCenter(
      center: center,
      width: 600,
      height: 800,
    );
    canvas.rotate(50 * math.pi / 180);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
