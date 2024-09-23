import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.02997641, size.height * 0.7219548);
    path_0.cubicTo(
        size.width * -0.03384692,
        size.height * 0.5851500,
        size.width * 0.0004211128,
        size.height * 0.4673556,
        size.width * 0.04409000,
        size.height * 0.4673556);
    path_0.lineTo(size.width * 0.3166667, size.height * 0.4673556);
    path_0.lineTo(size.width * 0.3368256, size.height * 0.3726919);
    path_0.cubicTo(
        size.width * 0.3586974,
        size.height * 0.2699911,
        size.width * 0.3905333,
        size.height * 0.1922677,
        size.width * 0.4275923,
        size.height * 0.1511048);
    path_0.lineTo(size.width * 0.4275923, size.height * 0.1511048);
    path_0.cubicTo(
        size.width * 0.4685308,
        size.height * 0.1056306,
        size.width * 0.5132872,
        size.height * 0.1076008,
        size.width * 0.5538077,
        size.height * 0.1566621);
    path_0.lineTo(size.width * 0.5581256, size.height * 0.1618919);
    path_0.cubicTo(
        size.width * 0.6001282,
        size.height * 0.2127476,
        size.width * 0.6352359,
        size.height * 0.3077621,
        size.width * 0.6574897,
        size.height * 0.4307984);
    path_0.lineTo(size.width * 0.6633436, size.height * 0.4631589);
    path_0.cubicTo(
        size.width * 0.6638128,
        size.height * 0.4657532,
        size.width * 0.6646897,
        size.height * 0.4673556,
        size.width * 0.6656385,
        size.height * 0.4673556);
    path_0.lineTo(size.width * 0.9465282, size.height * 0.4673556);
    path_0.cubicTo(
        size.width * 0.9848487,
        size.height * 0.4673556,
        size.width * 1.016892,
        size.height * 0.5589452,
        size.width * 1.020549,
        size.height * 0.6789177);
    path_0.lineTo(size.width * 1.024246, size.height * 0.8002718);
    path_0.cubicTo(
        size.width * 1.028431,
        size.height * 0.9376210,
        size.width * 0.9940949,
        size.height * 1.056452,
        size.width * 0.9502256,
        size.height * 1.056452);
    path_0.lineTo(size.width * 0.04752333, size.height * 1.056452);
    path_0.cubicTo(
        size.width * 0.009010077,
        size.height * 1.056452,
        size.width * -0.02312951,
        size.height * 0.9639597,
        size.width * -0.02654308,
        size.height * 0.8433065);
    path_0.lineTo(size.width * -0.02997641, size.height * 0.7219548);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3166667, size.height * 0.4713879);
    path_1.lineTo(size.width * 0.3173513, size.height * 0.4713879);
    path_1.lineTo(size.width * 0.3177308, size.height * 0.4695992);
    path_1.lineTo(size.width * 0.3378923, size.height * 0.3749363);
    path_1.cubicTo(
        size.width * 0.3596077,
        size.height * 0.2729573,
        size.width * 0.3912205,
        size.height * 0.1957806,
        size.width * 0.4280179,
        size.height * 0.1549073);
    path_1.cubicTo(
        size.width * 0.4686718,
        size.height * 0.1097524,
        size.width * 0.5131128,
        size.height * 0.1117089,
        size.width * 0.5533462,
        size.height * 0.1604258);
    path_1.lineTo(size.width * 0.5576667, size.height * 0.1656548);
    path_1.cubicTo(
        size.width * 0.5993897,
        size.height * 0.2161758,
        size.width * 0.6342692,
        size.height * 0.3105653,
        size.width * 0.6563769,
        size.height * 0.4327919);
    path_1.lineTo(size.width * 0.6622282, size.height * 0.4651524);
    path_1.cubicTo(
        size.width * 0.6629256,
        size.height * 0.4690073,
        size.width * 0.6642282,
        size.height * 0.4713879,
        size.width * 0.6656385,
        size.height * 0.4713879);
    path_1.lineTo(size.width * 0.9465282, size.height * 0.4713879);
    path_1.cubicTo(
        size.width * 0.9841872,
        size.height * 0.4713879,
        size.width * 1.015679,
        size.height * 0.5613984,
        size.width * 1.019272,
        size.height * 0.6793024);
    path_1.lineTo(size.width * 1.022969, size.height * 0.8006565);
    path_1.cubicTo(
        size.width * 1.027082,
        size.height * 0.9356371,
        size.width * 0.9933385,
        size.height * 1.052419,
        size.width * 0.9502256,
        size.height * 1.052419);
    path_1.lineTo(size.width * 0.04752333, size.height * 1.052419);
    path_1.cubicTo(
        size.width * 0.009674103,
        size.height * 1.052419,
        size.width * -0.02191136,
        size.height * 0.9615242,
        size.width * -0.02526603,
        size.height * 0.8429516);
    path_1.lineTo(size.width * -0.02869949, size.height * 0.7215976);
    path_1.cubicTo(
        size.width * -0.03250308,
        size.height * 0.5871516,
        size.width * 0.001174026,
        size.height * 0.4713879,
        size.width * 0.04409000,
        size.height * 0.4713879);
    path_1.lineTo(size.width * 0.3166667, size.height * 0.4713879);
    path_1.close();
Paint paint_1_shadow = Paint()
  ..style = PaintingStyle.fill
  ..color = Colors.black.withOpacity(0.09)
  ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

canvas.drawPath(path_1, paint_1_shadow);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
