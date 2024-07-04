import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 130,
            width: 400,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.16),
                  offset: const Offset(0.0, 10.0),
                  blurRadius: 10.0,

                  //blurStyle: BlurStyle.outer
                ),
              ],
            ),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/clipperticket.png'),
                ),
                const SizedBox(
                    width: 10), // Khoảng cách giữa hình ảnh và tiêu đề

                Expanded(
                  child: Text(
                    '"SIEUDEAL70" Giảm 70k cho đơn hàng Online từ 599k', // Thay thế "Tiêu đề" bằng tiêu đề thực tế của bạn
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Radio(
                    value: '',
                    groupValue: '',
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: (index) {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
