import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitleComponent extends StatelessWidget {
  String text;
  TitleComponent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontFamily: "MarkaziText-Bold", fontSize: 20, color: Colors.white),
    );
  }
}
