// Show move to Shared Widgets inside a package
import 'package:flutter/material.dart';

class TopOutCurveCustomPainter extends CustomPainter {
  final Color color;

  TopOutCurveCustomPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 1);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 1, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.5, 0, 0, size.height * 0.2);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
