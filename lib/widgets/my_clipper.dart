

import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var smallLineLength = size.width / 20;
    const  smallLineHeight = 20;
    var path = Path();

    path.lineTo(0, size.height);
    for (int i = 1; i <= 20; i++) {
      if (i % 2 == 0) {
        path.lineTo(smallLineLength * i, size.height);
      } else {
        path.lineTo(smallLineLength * i, size.height - smallLineHeight);
        
      }
    }
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}