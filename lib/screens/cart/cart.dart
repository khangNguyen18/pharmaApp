import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/components/title_component.dart';
import 'package:pharma_app/screens/cart/buy_bottom_bar.dart';
import 'package:pharma_app/screens/cart/cart_item.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final cartItem = CartItem(title: 'Chọn tất cả');
  final checkBoxList = [
    CartItem(
      title: 'BeroccaPerformance',
    ),
    // CheckBoxModal(title: 'Check box 1'),
    // CheckBoxModal(title: 'Check box 2'),
    // CheckBoxModal(title: 'Check box 3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: TitleComponent(
          color: Colors.white,
          text: 'Giỏ hàng',
        ),
      ),
      body: ListView(
        children: [
          CartItem(title: 'hello'),
          ListTile(
            leading: Checkbox(value: false, onChanged: (value) {}),
            title: Text(cartItem.title),
            // onTap: () => onAllChecked(allChecked),
            // leading: Checkbox(
            //     value: allChecked.value,
            //     onChanged: (value) => onAllChecked(allChecked)),
            // title: Text(allChecked.title),
          ),
          // Divider(),
          // ...checkBoxList.map(
          //   (item) => ListTile(
          //     onTap: () => onItemChecked(item),
          //     leading: Checkbox(
          //         value: item.value, onChanged: (value) => onItemChecked(item)),
          //     title: Text(item.title),
          //   ),
          //),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 100,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), side: BorderSide),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(IconlyBold.discount),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: TextComponent(
                          text: 'Mã khuyến mãi',
                          size: 18,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Icon(IconlyLight.arrow_right_2),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('Tất cả'),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextComponent(
                              text: 'Tổng tiền',
                              size: 13,
                            ),
                            TextComponent(
                              text: '115.000 đ',
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                        ),
                        child: TextComponent(
                          text: 'Mua hàng',
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//   onAllChecked(CartItem cbItem) {
//     final newValue = !cbItem.value;
//     setState(() {
//       cbItem.value = newValue;
//       checkBoxList.forEach((element) {
//         element.value = newValue;
//       });
//     });
//   }

//   onItemChecked(CartItem cbItem) {
//     final newValue = !cbItem.value;
//     setState(() {
//       cbItem.value = newValue;

//       if (!newValue) {
//         allChecked.value = false;
//       } else {
//         final allListChecked = checkBoxList.every((element) => element.value);
//         allChecked.value = allListChecked;
//       }
//     });
//   }
// }

// class CheckBoxModal {
//   String title;
//   bool value;
//   CheckBoxModal({required this.title, this.value = false});
// }
