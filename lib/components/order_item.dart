import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/product_model.dart';

class OrderItem extends StatelessWidget {
  bool isCartOverLayItem;
  Product list;
  OrderItem({super.key, this.isCartOverLayItem = false, required this.list});

  @override
  Widget build(BuildContext context) {
    if (isCartOverLayItem == false) {
      return Card(
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          height: 175,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  list.photoUrl!.first.toString(),
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                        text: //chỗ này sau này là title được truyền vào
                            list.title.toString(),
                        size: 22,
                        weight: FontWeight.bold,
                      ),
                      TextComponent(
                        text: 'Phân loại: ${list.unit}',
                        size: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            text:
                                '${NumberFormat.currency(locale: "vi").format(int.parse(list.price.toString()))}',
                            size: 35,
                            color: Theme.of(context).colorScheme.primary,
                            weight: FontWeight.bold,
                          ),
                          TextComponent(text: 'Số lượng: 1'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          height: 175,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  list.photoUrl!.first.toString(),
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                        text: //chỗ này sau này là title được truyền vào
                            list.title.toString(),
                        maxLines: 5,
                        size: 22,
                        weight: FontWeight.bold,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            text:
                                '${NumberFormat.currency(locale: "vi").format(int.parse(list.price.toString()))}',
                            size: 35,
                            color: Theme.of(context).colorScheme.primary,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
