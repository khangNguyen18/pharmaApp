import 'package:flutter/material.dart';
import 'package:pharma_app/widgets/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(title: 'Cart',);
  }
}