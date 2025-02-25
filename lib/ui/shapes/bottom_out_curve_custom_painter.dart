import 'package:flutter/material.dart';

class BottomOutCurveCustomPainter extends CustomPainter {
  final Color color;

  const BottomOutCurveCustomPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * 0.80,
      size.width,
      size.height * 0.50,
    );
    path.quadraticBezierTo(
      size.width,
      size.height * 0.40,
      size.width,
      0,
    );
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
