import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/provider/cart_provider.dart';
import 'package:pharma_app/screens/cart/cart_item.dart';
import 'package:pharma_app/screens/cart/payment_screen.dart';
import 'package:pharma_app/screens/discount_screen.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
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
        title: Column(
          children: [
            TextComponent(
              color: Colors.white,
              text: "Giỏ hàng",
              isTitle: true,
            ),
          ],
        ),
        actions: [
          IconComponent(
            icon: Icon(IconlyLight.delete),
            onIconPress: () {},
          ),
        ],
      ),
      body: Transform.translate(
        offset: Offset(-10, 0),
        child: Transform.translate(
          offset: Offset(10, 0),
          child: ListView.builder(
            itemCount: cart.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                confirmDismiss: (DismissDirection direction) async {
                  if (direction == DismissDirection.endToStart) {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: TextComponent(
                            text:
                                'Bạn có chắc chắn muốn xoá sản phẩm khỏi giỏ hàng?',
                            size: 25,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: TextComponent(
                                text: 'Đồng ý',
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: TextComponent(
                                text: 'Không',
                                color: Theme.of(context).colorScheme.primary,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                background: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(50),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: FaIcon(
                      FontAwesomeIcons.trash,
                      color: Colors.white,
                      // textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                key: ValueKey(cart.products[index].productId),
                onDismissed: (DismissDirection direction) {},
                child: ListTile(
                    // leading: Checkbox(
                    //   value: checkBoxList[index].value,
                    //   onChanged: (value) => onItemChecked(
                    //     checkBoxList[index],
                    //   ),
                    // ),
                    title: CartItem(
                  quan: cart.products[index].quantity,
                  id: cart.products[index].productId,
                  idUser: cart.idUser,
                )),

                // Column(
                //   children: [
                //     for (var i = 1; i < checkBoxList.length; i++) ...[
                //       ListTile(
                //         leading: Checkbox(
                //           value: checkBoxList[i].value,
                //           onChanged: (value) => onItemChecked(checkBoxList[i]),
                //         ),
                //         title: checkBoxList[i],
                //       ),

                //       // ...checkBoxList.map(
                //       //   (item) => ListTile(
                //       //     leading: Checkbox(
                //       //       value: item.value,
                //       //       onChanged: (value) => onItemChecked(item),
                //       //     ),
                //       //     title: CartItem(),
                //       //   ),
                //       // ),
                //     ],
                //   ],
                // ),
              );
            },
          ),
          // child: ListView.builder(
          //     itemCount: checkBoxList.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Dismissible(
          //         background: Container(
          //           color: Colors.red,
          //           child: FaIcon(FontAwesomeIcons.trash),
          //         ),
          //         key: ValueKey<CartItem>(checkBoxList[index]),
          //         onDismissed: (DismissDirection direction) {
          //           setState(() {
          //             checkBoxList.removeAt(index);
          //           });
          //         },
          //         child: ListView(
          //           children: [
          //             ...checkBoxList.map(
          //               (item) => ListTile(
          //                 leading: Checkbox(
          //                   value: item.value,
          //                   onChanged: (value) => onItemChecked(item),
          //                 ),
          //                 title: CartItem(),
          //               ),
          //             ),
          //           ],
          //         ),

          //         //
          //       );
          //     }

          //
          //     //),
          //     ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                offset: Offset(-2.0, 0),
              ),
            ],
            color: Colors.white,
          ),
          height: 130,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiscountScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
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
                            weight: FontWeight.w500,
                            size: 22,
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextComponent(
                                text: 'Tổng tiền',
                                size: 18,
                              ),
                              TextComponent(
                                text:
                                    '${NumberFormat.currency(locale: "vi").format(
                                  int.parse(
                                    cart.total.toString(),
                                  ),
                                )}',
                                size: 35,
                                weight: FontWeight.w900,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(),
                              ),
                            );
                          },
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
                            size: 25,
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
      ),
    );
  }

  // onAllChecked(CartItem cbItem) {
  //   final newValue = !cbItem.value;
  //   setState(() {
  //     cbItem.value = newValue;
  //     checkBoxList.forEach((element) {
  //       element.value = newValue;
  //     });
  //   });
  // }

  // onItemChecked(CartItem cbItem) {
  //   final newValue = !cbItem.value;
  //   setState(() {
  //     cbItem.value = newValue;
  //     if (!newValue) {
  //       allCartItemsChecked.value = false;
  //     } else {
  //       final allListChecked = checkBoxList.every((element) => element.value);
  //       allCartItemsChecked.value = allListChecked;
  //     }
  //   });
  // }

  // deleteCartItem(CartItem cbItem) {
  //   setState(() {
  //     if (cbItem.value == true) {
  //       checkBoxList.remove(cbItem);
  //     }
  //   });
  // }
}

// class CheckBoxModal {
//   String title;
//   bool value;
//   CheckBoxModal({required this.title, this.value = false});
// }
