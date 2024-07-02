import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/text_component.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hello ');
      },
      child: SizedBox(
        width: 200,
        height: 370,
        child: Card(
          elevation: 3,
          color: Colors.white,
          child: Column(
            children: [
              const Image(
                image: AssetImage(
                    'assets/images/medicines/BeroccaPerformance.png'),
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Viên sủi Berocca Performance bổ sung vitamin và khoáng chất hương xoài (Tuýp 10 viên)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 12),
                    //chỗ này sẽ làm if discount = ... => show Text()
                    TextComponent(
                      text: '115.000 đ',
                      size: 25,
                      color: Theme.of(context).colorScheme.primary,
                      weight: FontWeight.w900,
                    ),
                    const SizedBox(height: 10),
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
                          text: 'Đã bán 7,6k',
                          size: 14,
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
