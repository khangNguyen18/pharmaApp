import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/screens/cart/cart.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        shadowColor: Colors.black,
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
          style: IconButton.styleFrom(foregroundColor: Colors.white),
        ),
        actions: [
          IconComponent(
            icon: Icon(
              IconlyLight.buy,
            ),
            iconBackgroundColor: null,
            onIconPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Cart(),
                ),
              );
            },
            iconColor: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Image(
            image: AssetImage('assets/images/medicines/BeroccaPerformance.png'),
          ),
        ],
      ),
    );
  }
}
