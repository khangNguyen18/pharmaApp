import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/widgets/my_clipper.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return CouponCard(
      curveAxis: Axis.vertical,
      firstChild: Container(
        color: primaryColor,
        child: Image(
          image: AssetImage('assets/images/logo_white_small.png'),
        ),
      ),
      secondChild: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            color: Colors.blue,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextComponent(
                        text:
                            '"SIEUDEAL70" Giảm 70k cho đơn hàng Online từ 599k'),
                  ],
                ),
              ),
            ],
          )),
    );
    // return Container(
    //   child: Row(
    //     children: [
    //       Container(
    //         height: 130,
    //         width: 400,
    //         margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    //         padding: EdgeInsets.all(10),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //               topRight: Radius.circular(10),
    //               bottomRight: Radius.circular(10)),
    //           color: Colors.white,
    //           boxShadow: <BoxShadow>[
    //             BoxShadow(
    //               color: const Color(0xFF000000).withOpacity(0.16),
    //               offset: const Offset(0.0, 10.0),
    //               blurRadius: 10.0,

    //               //blurStyle: BlurStyle.outer
    //             ),
    //           ],
    //         ),
    //         child: Row(
    //           children: [
    //             Image(
    //               image: AssetImage('assets/images/clipperticket.png'),
    //             ),
    //             const SizedBox(
    //                 width: 10), // Khoảng cách giữa hình ảnh và tiêu đề

    //             Expanded(
    //               child: Text(
    //                 '"SIEUDEAL70" Giảm 70k cho đơn hàng Online từ 599k', // Thay thế "Tiêu đề" bằng tiêu đề thực tế của bạn
    //                 style: TextStyle(
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ),
    //             Radio(
    //                 value: '',
    //                 groupValue: '',
    //                 activeColor: Theme.of(context).colorScheme.primary,
    //                 onChanged: (index) {})
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
