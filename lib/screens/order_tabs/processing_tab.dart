import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/components/order_item.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/screens/cart/cart_item.dart';
import 'package:pharma_app/components/product_card.dart';

class ProcessingTab extends StatelessWidget {
  const ProcessingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // OrderItem(),
        // OrderItem(),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                indent: 20.0,
                endIndent: 10.0,
                thickness: 1,
              ),
            ),
            TextComponent(text: 'Có thể bạn cũng thích'),
            Expanded(
              child: Divider(
                indent: 20.0,
                endIndent: 10.0,
                thickness: 1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ProductCard(),
            // ProductCard(),
          ],
        )
      ],
    );
  }
}
