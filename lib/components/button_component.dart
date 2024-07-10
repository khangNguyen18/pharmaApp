import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent(
      {super.key,
      required this.onTap,
      required this.content,
      this.color = const Color(0xffF5F5F5),
      this.colorBackground = const Color(0xff40A578),
      this.widthSize = 185,
      this.heightSize = 50});

  void Function() onTap;
  String content;
  Color color;
  Color colorBackground;
  double widthSize;
  double heightSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        content,
        style: TextStyle(
          color: color,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: colorBackground,
        fixedSize: Size(widthSize, heightSize),
      ),
    );
  }
}