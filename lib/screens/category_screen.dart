import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/title_component.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Row(
            children: [
              IconComponent(
                  icon: Icon(Icons.textsms_outlined),
                  iconBackgroundColor: null,
                  iconColor: Colors.white,
                  onIconPress: () {}),
              IconComponent(
                  icon: Icon(Icons.shopping_cart_outlined),
                  iconBackgroundColor: null,
                  onIconPress: () {},
                  iconColor: Colors.white),
            ],
          )
        ],
        title: TitleComponent(
          text: 'Danh mục thuốc',
          color: Colors.white,
        ),
      ),
    );
  }
}
