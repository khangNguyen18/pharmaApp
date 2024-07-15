import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/voucher_model.dart';
import 'package:pharma_app/provider/cart_provider.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/screens/discount_screen.dart';
import 'package:pharma_app/services/api.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<VoucherModel> vouchers = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    vouchers = await Api.getVoucher();
    setState(() {});
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    final user = Provider.of<UserProvider>(context).user;
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
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          style: IconButton.styleFrom(foregroundColor: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(IconlyBold.discount),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: TextComponent(
                      text: 'Đã áp dụng ',
                      weight: FontWeight.w500,
                      size: 22,
                    ),
                  ),
                  TextComponent(
                    text: cart.voucher == ""
                        ? ""
                        : vouchers.isEmpty
                            ? ""
                            : vouchers
                                .firstWhere(
                                    (voucher) => voucher.id == cart.voucher)
                                .name,
                  ),
                ],
              )),
          const Divider(
            height: 1,
            color: Color.fromARGB(255, 219, 219, 219),
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(IconlyBold.location),
                        Align(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Center(
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
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.arrow_right_2),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Align(
                          child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Center(
                          child: Text(
                            user.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )),
                      Align(
                          child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Center(
                          child: Text(
                            "|",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )),
                      Align(
                          child: Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: const Center(
                          child: Text(
                            "0793610514",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 30),
                    child: const Center(
                      child: Text(
                        "Hẻm c3/544 Phạm Hùng,Bình Hưng,Bình Chánh, Thành phố Hồ Chí Minh",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: Color.fromARGB(255, 219, 219, 219),
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextComponent(
                    text: "Sản phẩm",
                    weight: FontWeight.w500,
                    maxLines: 3,
                  ),
                ),
                Row(
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
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: Color.fromARGB(255, 219, 219, 219),
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(IconlyLight.wallet),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: TextComponent(
                        text: 'Phương thức thanh toán',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextComponent(text: 'Tiền mặt'),
                    Icon(IconlyLight.arrow_right_2),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: Color.fromARGB(255, 219, 219, 219),
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextComponent(
                    text: "Chi tiết thanh toán",
                    weight: FontWeight.w500,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextComponent(text: 'Tạm tính (1 sản phẩm)'),
                    TextComponent(text: '115.000 đ'),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                //CHO NAY DANG BI LOI NE SON
                
                // if (cart.voucher != '' || vouchers.isNotEmpty)
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       TextComponent(text: 'Áp dụng ${vouchers
                //                 .firstWhere(
                //                     (voucher) => voucher.id == cart.voucher)
                //                 .name}' ),
                //       TextComponent(text: '115.000 đ'),
                //     ],
                //   ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextComponent(text: 'Tạm tính (1 sản phẩm)'),
                    TextComponent(text: '115.000 đ'),
                  ],
                ),
              ],
            ),
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
                      builder: (context) => const DiscountScreen(),
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
                        const Icon(IconlyBold.discount),
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
                    const Icon(IconlyLight.arrow_right_2),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                            padding: const EdgeInsets.symmetric(horizontal: 30),
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
