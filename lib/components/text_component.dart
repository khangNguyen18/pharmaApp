import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  String text;
  Color color;
  FontStyle fontStyle;
  TextDecoration decoration;
  double size;
  FontWeight weight;
  bool isTitle;
  int maxLines;

  TextComponent(
      {super.key,
      required this.text,
      this.size = 22,
      this.weight = FontWeight.normal,
      this.color = Colors.black,
      this.fontStyle = FontStyle.normal,
      this.decoration = TextDecoration.none,
      this.isTitle = false, this.maxLines = 2});

  @override
  Widget build(BuildContext context) {
    if (isTitle == false) {
      return Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.markaziText(
          textStyle: TextStyle(
            color: color,
            fontSize: size,
            fontStyle: fontStyle,
            decoration: decoration,
            fontWeight: weight,
          ),
        ),
      );
    } else {
      return Text(
        text,
        style: GoogleFonts.markaziText(
          textStyle: TextStyle(
            color: color,
            fontFamily: "MarkaziText-Bold",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }
}
