import 'dart:ui' as ui;
import 'package:flutter/material.dart';




class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(Offset(size.width*0.50,size.height*0.24),Offset(size.width*0.50,size.height*1.00),[Color(
        0xFFE8A874),Color(0xFF986842)],[0.00,1.00]);

    Path path0 = Path();
    path0.moveTo(size.width*0.0024307,size.height*0.2355868);
    path0.quadraticBezierTo(size.width*0.0267380,size.height*0.3039947,size.width*0.1191055,size.height*0.3072871);
    path0.quadraticBezierTo(size.width*0.6678415,size.height*0.3083845,size.width*0.8507535,size.height*0.3087504);
    path0.quadraticBezierTo(size.width*0.9795819,size.height*0.3120427,size.width*0.9965970,size.height*0.3804507);
    path0.lineTo(size.width*0.9990277,size.height*0.9994147);
    path0.lineTo(size.width*0.0048614,size.height*0.9979514);
    path0.quadraticBezierTo(size.width*0.0042538,size.height*0.8073603,size.width*0.0024307,size.height*0.2355868);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
