import 'package:flutter/material.dart';

class IconComponent extends StatelessWidget {
  Widget icon;
  Color? iconBackgroundColor;
  void Function() onIconPress;
  Color iconColor;
  double size;
  bool hasBorder;

  IconComponent(
      {super.key,
      required this.icon,
      this.size = 30,
      this.iconBackgroundColor,
      required this.onIconPress,
      this.iconColor = Colors.white,
      this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    if (hasBorder == true) {
      return Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.8),
        ),
        child: IconButton(
          onPressed: onIconPress,
          icon: icon,
          color: iconColor,
          iconSize: size,
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: onIconPress,
          icon: icon,
          color: iconColor,
          iconSize: size,
        ),
      );
    }
  }
}
