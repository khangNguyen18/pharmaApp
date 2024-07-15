import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/voucher_model.dart';
import 'package:pharma_app/provider/cart_provider.dart';
import 'package:pharma_app/screens/cart/cart_item.dart';
import 'package:pharma_app/screens/cart/payment_screen.dart';
import 'package:pharma_app/screens/discount_screen.dart';
import 'package:pharma_app/services/api.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 0;
  List<VoucherModel> vouchers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    vouchers = await Api.getVoucher();
    setState(() {});
  }

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
                    ),
                  ),
                ),
                key: ValueKey(cart.products[index].productId),
                onDismissed: (DismissDirection direction) {},
                child: ListTile(
                    title: CartItem(
                  quan: cart.products[index].quantity,
                  id: cart.products[index].productId,
                  idUser: cart.idUser,
                )),
              );
            },
          ),
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
                      ],
                    ),
                    TextComponent(
                      text: cart.voucher == ""
                          ? ""
                          : vouchers.isEmpty
                              ? ""
                              : vouchers
                                  .firstWhere(
                                      (voucher) => voucher.id == cart.voucher)
                                  .code,
                    ),
                    Icon(IconlyLight.arrow_right_2),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextComponent(
                                    text: 'Tổng thanh toán',
                                    size: 20,
                                  ),
                                  TextComponent(
                                    text: cart.discountAmount > 0
                                        ? 'đ${NumberFormat.decimalPattern("vi").format(
                                            int.parse(
                                              cart.discountAmount.toString(),
                                            ),
                                          )}'
                                        : '${NumberFormat.decimalPattern("vi").format(
                                            int.parse(
                                              cart.total.toString(),
                                            ),
                                          )}',
                                    size: 22,
                                    weight: FontWeight.w900,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              if (cart.voucher != "")
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextComponent(
                                      text: 'Tiết kiệm',
                                      size: 20,
                                    ),
                                    TextComponent(
                                      text:
                                          'đ${NumberFormat.decimalPattern("vi").format(
                                        int.parse(
                                          (cart.total - cart.discountAmount)
                                              .toString(),
                                        ),
                                      )}',
                                      size: 22,
                                      weight: FontWeight.w900,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
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
                        backgroundColor: Theme.of(context).colorScheme.primary,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
