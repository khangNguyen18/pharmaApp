import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarCategory extends StatelessWidget {
  const TabBarCategory({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF6F6F6),
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: Theme.of(context).colorScheme.primary,
        // indicator: BoxDecoration(
        //   color: Colors.white, // Màu nền của tab được chọn
        // ),
        labelColor: Theme.of(context).colorScheme.primary,
        labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        unselectedLabelColor: Colors.black,
        tabAlignment: TabAlignment.start,
      ),
    );
  }
}