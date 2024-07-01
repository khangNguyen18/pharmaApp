import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/screens/cart/cart.dart';

class CartItem extends StatefulWidget {
  CartItem({super.key, this.value = false});

  bool value;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;
  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      } else {
        showConfirmDialog();
      }
    });
  }

  void showConfirmDialog() {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: TextComponent(
            text: 'Bạn có chắc chắn muốn xoá sản phẩm khỏi giỏ hàng?',
            size: 20,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: TextComponent(
                text: 'Đồng ý',
                size: 14,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: TextComponent(
                text: 'Không',
                size: 14,
                color: Theme.of(context).colorScheme.primary,
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Bạn có chắc chắn muốn xoá sản phẩm khỏi giỏ hàng?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Đồng ý'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Không'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 165,
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                width: 90,
                image: AssetImage(
                    'assets/images/medicines/BeroccaPerformance.png'),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextComponent(
                    text: //chỗ này sau này là title được truyền vào
                        'Viên sủi Berocca Performance bổ sung vitamin và khoáng chất hương xoài (Tuýp 10 viên)',
                    size: 14,
                    weight: FontWeight.bold,
                  ),
                  TextComponent(
                    text: 'Phân loại: Hộp',
                    size: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextComponent(
                        text: '115.000 đ',
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                        weight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconComponent(
                              icon: FaIcon(FontAwesomeIcons.minus),
                              size: 9,
                              iconColor: Colors.black,
                              onIconPress: decreaseQuantity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextComponent(
                                text: quantity.toString(), size: 16),
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconComponent(
                              icon: FaIcon(FontAwesomeIcons.plus),
                              size: 9,
                              iconColor: Colors.black,
                              onIconPress: increaseQuantity,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
