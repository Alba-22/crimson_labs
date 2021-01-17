import 'package:flutter/material.dart';

class LoginBackgroundPainter extends CustomPainter {

  final BuildContext context;

  LoginBackgroundPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
    ..color = Theme.of(context).backgroundColor
    ..strokeWidth = 1;

    Path path = new Path();

    path.lineTo(0, size.height * 0.3);
    path.cubicTo(
      size.width * 0.33,
      size.height * 0.25,
      size.width * 0.66,
      size.height * 0.35,
      size.width * 1,
      size.height * 0.3
    );
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}