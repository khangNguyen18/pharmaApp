import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BuyBottomBar extends StatefulWidget {
  const BuyBottomBar({super.key});

  @override
  State<BuyBottomBar> createState() => _BuyBottomBarState();
}

class _BuyBottomBarState extends State<BuyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(IconlyLight.discount),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
