import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonFilterComponent extends StatefulWidget {
  const ButtonFilterComponent(
      {super.key, required this.content, required this.onTap});
  final String content;
  final void Function() onTap;

  @override
  State<ButtonFilterComponent> createState() => _ButtonFilterComponentState();
}

class _ButtonFilterComponentState extends State<ButtonFilterComponent> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
          widget.onTap();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Color(0xffD7FFED) : Color(0xffF5F5F5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
                width: 1,
                color: isSelected ? Color(0xff006769) : Color(0xff969696)),
          ),
        ),
        child: Text(
          widget.content,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}