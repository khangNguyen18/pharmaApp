import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/screens/auth/update_info.dart';
import 'package:pharma_app/screens/cart/cart_item.dart';
import 'package:pharma_app/screens/discount_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final allCartItemsChecked = CartItem();
  final List checkBoxList = [];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 75,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: TextComponent(
          text: 'Thanh toán',
          isTitle: true,
          color: Colors.white,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
          style: IconButton.styleFrom(foregroundColor: Colors.white),
        ),
      ),
      // body: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Row(
      //       children: <Widget>[
      //         FloatingActionButton.extended(
      //           onPressed: () {},
      //           label: const Text('Giao hàng tận nơi'),
      //         )
      //       ],
      //     )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    width: 190,
                    child: OutlinedButton(
                      child: Text(
                        'Giao hàng tận nơi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    )),
                SizedBox(
                  width: 2,
                ),
                SizedBox(
                    width: 190,
                    child: OutlinedButton(
                      child: Text(
                        'Nhận tại nhà thuốc',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    )),
              ],
            ),
          ),
          const Divider(
            height: 0,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: 2),
          Stack(
            children: [
              Row(
                children: [
                  Align(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Center(
                        child: Text(
                          "Thông tin người nhận",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 150),
                  IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => UpdateInfo(),
                      //   ),
                      // );
                    },
                    icon: const FaIcon(FontAwesomeIcons.penToSquare),
                    iconSize: 24,
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Align(
                      child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Center(
                      child: Text(
                        "Nguyễn Phước Nguyên",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )),
                  Align(
                      child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Center(
                      child: Text(
                        "0906816940",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  child: Container(
                margin: EdgeInsets.only(left: 20, right: 30),
                child: Center(
                  child: Text(
                    "Hẻm c3/544 Phạm Hùng,Bình Hưng,Bình Chánh, Thành phố Hồ Chí Minh",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              )),
              SizedBox(height: 10),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              Align(
                  child: Container(
                margin: EdgeInsets.only(
                  top: 4,
                  right: 300,
                ),
                child: Text(
                  "Sản phẩm",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        width: 120,
                        image: AssetImage(
                            'assets/images/medicines/BeroccaPerformance.png'),
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
                                  'Viên sủi Berocca Performance bổ sung vitamin và khoáng chất hương xoài (Tuýp 10 viên)',
                              size: 22,
                              weight: FontWeight.bold,
                            ),
                            TextComponent(
                              text: 'Phân loại: Hộp',
                              size: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextComponent(
                                  text: '115.000 đ',
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
              )
            ],
          ),
        ],
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: allCartItemsChecked.value,
                            onChanged: (value) =>
                                onAllChecked(allCartItemsChecked)),
                        Text('Tất cả'),
                      ],
                    ),
                    Row(
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
                                text: '115.000 đ',
                                size: 35,
                                weight: FontWeight.w900,
                                color: Colors.red,
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
                            text: 'Đặt hàng',
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

  onAllChecked(CartItem cbItem) {
    final newValue = !cbItem.value;
    setState(() {
      cbItem.value = newValue;
      checkBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemChecked(CartItem cbItem) {
    final newValue = !cbItem.value;
    setState(() {
      cbItem.value = newValue;
      if (!newValue) {
        allCartItemsChecked.value = false;
      } else {
        final allListChecked = checkBoxList.every((element) => element.value);
        allCartItemsChecked.value = allListChecked;
      }
    });
  }

  deleteCartItem(CartItem cbItem) {
    setState(() {
      if (cbItem.value == true) {
        checkBoxList.remove(cbItem);
      }
    });
  }
}
