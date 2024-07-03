import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  String text;
  Color color;
  FontStyle fontStyle;
  TextDecoration decoration;
  double size;
  FontWeight weight;
  bool isTitle;
  TextComponent(
      {super.key,
      required this.text,
      this.size = 16,
      this.weight = FontWeight.normal,
      this.color = Colors.black,
      this.fontStyle = FontStyle.normal,
      this.decoration = TextDecoration.none,
      this.isTitle = false});

  @override
  Widget build(BuildContext context) {
    if (isTitle == false) {
      return Text(
        text,
        style: TextStyle(
          color: color,
          fontFamily: "MarkaziText-Medium",
          fontSize: size,
          fontStyle: fontStyle,
          decoration: decoration,
          fontWeight: weight,
        ),
      );
    } else {
      return Text(
        text,
        style: TextStyle(
          color: color,
          fontFamily: "MarkaziText-Bold",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}
