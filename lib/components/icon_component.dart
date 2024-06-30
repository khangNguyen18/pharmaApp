import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconComponent extends StatelessWidget {
  Widget icon;
  Color? iconBackgroundColor;
  void Function() onIconPress;
  Color iconColor;
  double size;

  IconComponent(
      {super.key,
      required this.icon,
      this.size = 30,
      this.iconBackgroundColor,
      required this.onIconPress,
      this.iconColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
<<<<<<< HEAD
    return Container(
      decoration: BoxDecoration(
          color: iconBackgroundColor, borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        onPressed: onIconPress,
        icon: icon,
        color: iconColor,
        iconSize: size,
      ),
=======
    return 
        Container(
          decoration: BoxDecoration(
              color: iconBackgroundColor, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            onPressed: onIconPress,
            icon: icon,
            color: iconColor,
          ),
>>>>>>> 234aac509b2252eaa7c5b09f8242b2cbc60766f7
    );
  }
}
