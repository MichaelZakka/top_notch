// import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  LinearGradient Grad() {
    return LinearGradient(
        colors: [ThemeData().primaryColor, ThemeData().canvasColor]);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.9975426, size.height * 0.4653614);
    path0.quadraticBezierTo(size.width * 0.9713869, size.height * 0.5326807,
        size.width * 0.8977859, size.height * 0.5406627);
    path0.quadraticBezierTo(size.width * 0.3156691, size.height * 0.5417922,
        size.width * 0.1216302, size.height * 0.5421687);
    path0.quadraticBezierTo(size.width * 0.0191971, size.height * 0.5533886,
        size.width * -0.0000243, size.height * 0.6159639);
    path0.quadraticBezierTo(size.width * 0.0018248, size.height * 0.7628012,
        size.width * 0.0024331, size.height * 0.8117470);
    path0.quadraticBezierTo(size.width * 0.0186131, size.height * 0.8735693,
        size.width * 0.1216545, size.height * 0.8855422);
    path0.quadraticBezierTo(size.width * 0.7055961, size.height * 0.8866717,
        size.width * 0.9002433, size.height * 0.8870482);
    path0.quadraticBezierTo(size.width * 0.9811436, size.height * 0.8915663,
        size.width, size.height * 0.9472892);
    path0.quadraticBezierTo(size.width * 0.9993917, size.height * 0.8268072,
        size.width * 0.9975426, size.height * 0.4653614);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
