import 'package:flutter/cupertino.dart';

class TextComponent extends StatelessWidget {
  String text;
  Color color;
  FontStyle fontStyle = FontStyle.normal;
  TextDecoration decoration;
  TextComponent(
      {super.key,
      required this.text,
      required this.color,
      required this.fontStyle,
      required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: "MarkaziText-Medium",
          fontSize: 18,
          fontStyle: fontStyle,
          decoration: decoration),
    );
  }
}
