import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/screens/product_detail_screen.dart';
import 'package:pharma_app/services/api.dart';

class ProductCard extends StatefulWidget {
  ProductCard({super.key, required this.list});

  Product list;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              list: widget.list,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 200,
        height: 370,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 3,
          color: Colors.white,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  widget.list.photoUrl!.first.toString(),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(
                      text: widget.list.title.toString(),
                      size: 20,
                      weight: FontWeight.bold,
                    ),

                    const SizedBox(height: 5),
                    //chỗ này sẽ làm if discount = ... => show Text()
                    TextComponent(
                      text:
                          '${NumberFormat.currency(locale: "vi").format(int.parse(widget.list.price.toString()))}',
                      size: 32,
                      color: Theme.of(context).colorScheme.primary,
                      weight: FontWeight.w900,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          IconlyLight.buy,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '|',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (Colors.black),
                                fontSize: 18),
                          ),
                        ),
                        TextComponent(
                          text: 'Đã bán ${widget.list.sold.toString()}',
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Container(
    //   width: 220,
    //   height: 450,
    //   child: Stack(
    //     children: [
    //       Positioned(
    //         child: ElevatedButton(
    //           onPressed: () {},
    //           style: ElevatedButton.styleFrom(
    //             fixedSize: const Size(220, 450),
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(15),
    //             ),
    //             elevation: 3.0,
    //             shadowColor: Colors.black,
    //           ),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.max,
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const SizedBox(height: 230),
    //               TextComponent(
    //                 text:
    //                     'Viên sủi Berocca Performance bổ sung vitamin và khoáng chất hương xoài (Tuýp 10 viên)',
    //                 size: 16,
    //                 weight: FontWeight.bold,
    //               ),
    //               const SizedBox(height: 12),
    //               //chỗ này sẽ làm if discount = ... => show Text()
    //               TextComponent(
    //                 text: '115.000 đ',
    //                 size: 30,
    //                 color: Theme.of(context).colorScheme.primary,
    //                 weight: FontWeight.w900,
    //               ),
    //               const SizedBox(height: 10),
    //               Row(
    //                 children: [
    //                   Icon(
    //                     IconlyLight.buy,
    //                     color: Colors.black,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 5),
    //                     child: Text(
    //                       '|',
    //                       style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           color: (Colors.black),
    //                           fontSize: 20),
    //                     ),
    //                   ),
    //                   TextComponent(
    //                     text: 'Đã bán 7,6k',
    //                     size: 16,
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         child: Image(
    //           image:
    //               AssetImage('assets/images/medicines/BeroccaPerformance.png'),
    //           fit: BoxFit.fill,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
