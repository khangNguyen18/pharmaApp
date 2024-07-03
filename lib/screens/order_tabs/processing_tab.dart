import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/components/order_item.dart';
import 'package:pharma_app/screens/cart/cart_item.dart';

class ProcessingTab extends StatelessWidget {
  const ProcessingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderItem(),
        OrderItem(),
        Divider(),
      ],
    );
  }
}
