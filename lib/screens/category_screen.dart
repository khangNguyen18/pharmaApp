import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/screens/cart/cart.dart';
import 'package:pharma_app/components/product_card.dart';

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
        toolbarHeight: 110,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Row(
            children: [
              IconComponent(
                  icon: Icon(IconlyLight.chat),
                  iconBackgroundColor: null,
                  iconColor: Colors.white,
                  onIconPress: () {}),
              IconComponent(
                icon: Icon(
                  IconlyLight.buy,
                ),
                iconBackgroundColor: null,
                onIconPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                },
                iconColor: Colors.white,
              ),
            ],
          )
        ],
        title: TextComponent(
          text: 'Danh mục thuốc',
          color: Colors.white,
          isTitle: true,
        ),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ProductCard(),
              // ProductCard(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ProductCard(),
              // ProductCard(),
            ],
          )
        ],
      ),
    );
  }
}
