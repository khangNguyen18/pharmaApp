import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/text_component.dart';

class ProfileOptionComponent extends StatelessWidget {
  ProfileOptionComponent({super.key, required this.text, required this.icon, required this.onTap});

  String text;
  Widget icon;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 128, 128, 128),
                    offset: Offset(1, 3),
                    blurRadius: 4,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,
                    const SizedBox(
                      width: 10,
                    ),
                    TextComponent(
                      text: text,
                      size: 25,
                    ),
                  ],
                ),
                Icon(IconlyLight.arrow_right_2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
