import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  String text;
  Color color;
  FontStyle fontStyle;
  TextDecoration decoration;
  double size;
  FontWeight weight;

  TextComponent({
    super.key,
    required this.text,
    required this.size,
    this.weight = FontWeight.normal,
    this.color = Colors.black,
    this.fontStyle = FontStyle.normal,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
