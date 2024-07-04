import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/title_component.dart';
import 'package:pharma_app/screens/cart/cart.dart';

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
        toolbarHeight: 150,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconComponent(
              icon: FaIcon(FontAwesomeIcons.solidMessage),
              iconBackgroundColor: null,
              iconColor: Colors.white,
              onIconPress: () {}),
          IconComponent(
            icon: FaIcon(FontAwesomeIcons.cartShopping),
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
        centerTitle: true,
        title: TitleComponent(
          text: 'Danh mục thuốc',
          color: Colors.white,
        ),
      ),
    );
  }
}
