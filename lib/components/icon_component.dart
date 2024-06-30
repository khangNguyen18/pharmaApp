import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconComponent extends StatelessWidget {
  Icon icon;
  Color? iconBackgroundColor;
  void Function() onIconPress;
  Color iconColor = Colors.white;

  IconComponent(
      {super.key,
      required this.icon,
      required this.iconBackgroundColor,
      required this.onIconPress,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
        Container(
          decoration: BoxDecoration(
              color: iconBackgroundColor, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            onPressed: onIconPress,
            icon: icon,
            color: iconColor,
          ),
    );
  }
}
