import 'dart:math' as math;

import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';

class StainContainer extends StatelessWidget {
  final Widget child;
  final double size;
  final double angle;
  final double bottom;
  final double top;
  final double right;
  final double left;

  const StainContainer(
    this.child, {
    Key key,
    this.size = 200.0,
    this.angle = 50,
    this.bottom = 0.0,
    this.top,
    this.right = 0.0,
    this.left = 0.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: _Stain(
            size: size,
            angle: angle,
          ),
          left: left,
          right: right,
          top: top ?? size,
          bottom: bottom,
        ),
        child
      ],
    );
  }
}

class _Stain extends StatelessWidget {
  final num size;
  final num angle;

  const _Stain({Key key, this.size, this.angle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomStain(size, angle),
    );
  }
}

class _CustomStain extends CustomPainter {
  final double cSize;
  final double angle;

  _CustomStain(this.cSize, this.angle);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final fSize = cSize * 3;
    // set the color property of the paint
    paint.color = Style.primaryColor;
    // center of the canvas is (x,y) => (width/2, height/2)
    Offset center = Offset(size.width / 2, size.height / 2);

    Rect rect = Rect.fromCenter(
      center: center,
      width: fSize,
      height: fSize * 1.333333333,
    );
    canvas.rotate(angle * math.pi / 180);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
