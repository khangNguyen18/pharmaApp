import 'package:flutter/material.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:ticket_clippers/ticket_clippers.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipPath(
        clipper: RoundedEdgeClipper(
          edge: Edge.left,
          points: 10,
        ),
        child: Container(
          height: 150,
          width: 450,
          color: Color.fromARGB(255, 236, 236, 236),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0.0,1.0),
                      ),
                    ],
                  ),
                  child: Image(image: AssetImage('assets/images/clipperticket.png',),fit: BoxFit.fill,),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 236, 236),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextComponent(
                                  text: '"SIEUDEAL70" Giảm 70K cho đơn hàng Online từ 849k',
                                  size: 25,
                                  weight: FontWeight.bold,
                                ),
                                TextComponent(
                                  text: 'Trị giá 70.000 đ',
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                                Row(
                                  children: [TextComponent(text: 'HSD 12/07/2024'),TextComponent(text: 'Điều kiện')],
                                )
                              ],
                            ),
                          ),
                          Radio(value: '', groupValue: '', onChanged: (_) {})
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
