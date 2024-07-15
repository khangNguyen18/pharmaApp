import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/services/api.dart';
import 'package:pharma_app/widgets/add_to_cart_overlay.dart';
import 'package:provider/provider.dart';

class DetailBottomBar extends StatefulWidget {
  DetailBottomBar({super.key, required this.list});

  Product list;

  @override
  State<DetailBottomBar> createState() => _DetailBottomBarState();
}

class _DetailBottomBarState extends State<DetailBottomBar> {
  void _openAddToCartOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddToCartOverlay(list: widget.list),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final user = Provider.of<UserProvider>(context).user;

    return SafeArea(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 5),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
                width: 280,
                child: ElevatedButton(
                  onPressed: () {},
                  child: TextComponent(
                    text: 'Mua ngay',
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
              SizedBox(
                height: 60,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    _openAddToCartOverlay();
                  },
                  child: Icon(
                    CupertinoIcons.cart_badge_plus,
                    size: 40,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
