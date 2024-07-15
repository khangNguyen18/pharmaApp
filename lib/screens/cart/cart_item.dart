import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/activeElement_model.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/services/api.dart';

class CartItem extends StatefulWidget {
  CartItem(
      {super.key, required this.quan, required this.id, required this.idUser});

  int quan;
  String id;
  String idUser;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int quantity;
  late Product product = new Product(
      "",
      "",
      "",
      [],
      0,
      0,
      "",
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      [new ActiveElementModel("", [])],
      "",
      "",
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  void getData() async {
    product = await Api.getProductById(widget.id);
    quantity = widget.quan;
    setState(() {});
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
    updateQuantity();
  }

  void updateQuantity() async {
    var data = {
      "idUser": widget.idUser,
      "products": {"productId": widget.id, "quantity": quantity},
    };
    await Api.putToCart(data, context);
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      } else {
        showConfirmDialog();
      }
    });
    updateQuantity();
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
                quantity--;
                updateQuantity();
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
    setState(() {});

    if (product.id != "" && product.id!.isNotEmpty) {
      return Card(
        child: SizedBox(
          height: 165,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  product.photoUrl!.first.toString(),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(
                      text: product.title.toString(),
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    TextComponent(
                      text: 'Phân loại: ${product.unit}',
                      size: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextComponent(
                          text: product.discount > 0
                              ? '${NumberFormat.currency(locale: "vi").format(
                                  ((int.parse(product.price) -
                                          (int.parse(product.price) *
                                              product.discount /
                                              100)) *
                                      widget.quan),
                                )}'
                              : '${NumberFormat.currency(locale: "vi").format(
                                  ((int.parse(product.price) * widget.quan)),
                                )}',
                          size: 24,
                          color: Theme.of(context).colorScheme.primary,
                          weight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: IconComponent(
                                icon: FaIcon(FontAwesomeIcons.minus),
                                size: 13,
                                iconColor: Colors.black,
                                onIconPress: decreaseQuantity,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextComponent(
                                text: quantity.toString(),
                                size: 25,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: IconComponent(
                                icon: FaIcon(FontAwesomeIcons.plus),
                                size: 13,
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
    } else {
      return SizedBox.shrink();
    }
  }
}
