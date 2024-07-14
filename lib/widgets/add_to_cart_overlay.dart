import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/order_item.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/screens/auth/login_screen.dart';
import 'package:pharma_app/services/api.dart';
import 'package:provider/provider.dart';

class AddToCartOverlay extends StatefulWidget {
  AddToCartOverlay({super.key, required this.list});

  Product list;

  @override
  State<AddToCartOverlay> createState() => _AddToCartOverlayState();
}

class _AddToCartOverlayState extends State<AddToCartOverlay> {
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
            size: 25,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: TextComponent(
                text: 'Đồng ý',
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: TextComponent(
                text: 'Không',
                size: 20,
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
    final primaryColor = Theme.of(context).colorScheme.primary;
    final user = Provider.of<UserProvider>(context).user;

    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextComponent(
              text: 'Chọn sản phẩm',
              isTitle: true,
            ),
            OrderItem(
              isCartOverLayItem: true,
              list: widget.list,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextComponent(text: 'Số lượng'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconComponent(
                    icon: FaIcon(FontAwesomeIcons.minus),
                    size: 20,
                    iconColor: Colors.black,
                    onIconPress: decreaseQuantity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextComponent(
                    text: quantity.toString(),
                    size: 35,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconComponent(
                    icon: FaIcon(FontAwesomeIcons.plus),
                    size: 20,
                    iconColor: Colors.black,
                    onIconPress: increaseQuantity,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: 420,
              child: ElevatedButton(
                onPressed: () async {
                  if (user.email.isEmpty && user.email == "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  } else {
                    var data = {
                      "idUser": user.id,
                      "products": {
                        "productId": widget.list.id,
                        "quantity": quantity
                      },
                    };
                    await Api.putToCart(data, context);
                  }
                },
                child: TextComponent(
                  text: 'Thêm vào giỏ',
                  color: Colors.white,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
