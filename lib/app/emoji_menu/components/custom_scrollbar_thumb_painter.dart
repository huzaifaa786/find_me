import 'package:flutter/material.dart';

class CustomScrollbarThumbPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.fill;

    final double thumbHeight = 30;
    final double thumbWidth = 5;
    final double thumbPosition = (size.height - thumbHeight) / 2;

    canvas.drawRect(
      Rect.fromLTWH(0, thumbPosition, thumbWidth, thumbHeight),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
