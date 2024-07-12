import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharma_app/components/text_component.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent(
      {super.key,
      required this.onTap,
      required this.content,
      this.color = const Color(0xffF5F5F5),
      this.colorBackground = const Color(0xff40A578),
      this.widthSize = 185,
      this.heightSize = 50,
      this.radius = 5});

  void Function() onTap;
  Widget content;
  Color color;
  Color colorBackground;
  double widthSize;
  double heightSize;
  double radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: content,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        backgroundColor: colorBackground,
        fixedSize: Size(widthSize, heightSize),
      ),
    );
  }
}
