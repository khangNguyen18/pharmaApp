import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharma_app/components/discount_card.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/voucher_model.dart';
import 'package:pharma_app/provider/cart_provider.dart';
import 'package:pharma_app/services/api.dart';
import 'package:provider/provider.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  int? groupValue;
  late List<VoucherModel> vouchers = [];
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
    if (cart.voucher != "") {
      int voucherIndex = vouchers.indexWhere((v) => v.id == cart.voucher);
      if (voucherIndex != -1) {
        setState(() {
          groupValue = voucherIndex;
        });
      }
    }
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
        title: TextComponent(
            color: Colors.white, text: 'Mã khuyến mãi', isTitle: true),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DiscountCard(
                  voucher: vouchers[index],
                  apply: cart.total < vouchers[index].minOrderAmount),
              Opacity(
                opacity:
                    cart.total < vouchers[index].minOrderAmount ? 0.5 : 1.0,
                child: Radio<int>(
                    value: index,
                    groupValue: groupValue,
                    toggleable: true,
                    onChanged: cart.total < vouchers[index].minOrderAmount
                        ? null
                        : (int? value) async {
                            if (value != null) {
                              await Api.ApplyVoucher(
                                  cart.idUser, vouchers[index].code, context);
                            } else {
                              await Api.RemoveVoucher(cart.idUser, context);
                            }

                            setState(() {
                              groupValue = value;
                            });
                          }),
              ),
            ],
          );
        },
        itemCount: vouchers.length,
      ),
    );
  }
}
