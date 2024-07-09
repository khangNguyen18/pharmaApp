import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/product_card.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/screens/cart/cart.dart';
import 'package:pharma_app/widgets/detail_bottom_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.list});

  dynamic list;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        shadowColor: Colors.black,
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
        actions: [
          IconComponent(
            icon: Icon(
              IconlyLight.buy,
            ),
            iconBackgroundColor: null,
            onIconPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Cart(),
                ),
              );
            },
            iconColor: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(
              'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          // Image(
          //   image: AssetImage('assets/images/medicines/BeroccaPerformance.png'),
          // ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(136, 0, 119, 4),
            ),
            child: TextComponent(
              text: 'Sản phẩm 100% chính hãng được cung cấp bởi PharmaTown',
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: TextComponent(
              text: list["title"].toString(),
              size: 30,
              maxLines: 3,
              weight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: TextComponent(
              text: '${list["price"]} đ/Hộp'.toString(),
              color: primaryColor,
              weight: FontWeight.w800,
              size: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextComponent(
              text:
                  'Giá đã bao gồm thuế. Phí vận chuyển và các chi phí khác (nếu có) sẽ được thể hiện khi đặt hàng',
              color: Colors.grey,
              size: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Icon(
                  IconlyLight.buy,
                  color: Colors.black,
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '|',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: (Colors.black),
                        fontSize: 25),
                  ),
                ),
                TextComponent(
                  text: 'Đã bán ',
                  size: 22,
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 0.7,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage('assets/icons/delivery_truck.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextComponent(text: 'Giao hàng siêu tốc'),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/icons/medicine.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextComponent(text: 'Thuốc đủ tiêu chuẩn'),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 30,
            color: Color.fromARGB(255, 219, 219, 219),
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextComponent(
              text: 'Mô tả sản phẩm',
              isTitle: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextComponent(
              text:
                  'Viên sủi Berocca Performance Mango Multivitamin bổ sung vitamin và khoáng chất cần thiết cho cơ thể, hỗ trợ chuyển hóa tạo năng lượng, giúp giảm căng thẳng bớt mệt mỏi, tăng cường tập trung tỉnh táo. Hỗ trợ giảm tình trạng thiếu hụt vitamin và khoáng chất.',
              maxLines: 6,
              size: 20,
            ),
          ),
          Divider(
            height: 30,
            color: Color.fromARGB(255, 219, 219, 219),
            thickness: 5,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextComponent(
                      text: 'Sản phẩm cùng thương hiệu',
                      isTitle: true,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: TextButton(
                        onPressed: () {},
                        child: TextComponent(
                          text: 'Xem thêm',
                          color: primaryColor,
                        ),
                      ))
                ],
              ),
              // Container(
              //   height: 380,
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              //     child: ListView(
              //       scrollDirection: Axis.horizontal,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(right: 5),
              //           child: ProductCard(),
              //         ),
              //         ProductCard(),
              //         ProductCard(),
              //         ProductCard(),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          Divider(
            height: 30,
            color: Color.fromARGB(255, 219, 219, 219),
            thickness: 5,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextComponent(
                      text: 'Top bán chạy toàn quốc',
                      isTitle: true,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: TextButton(
                        onPressed: () {},
                        child: TextComponent(
                          text: 'Xem thêm',
                          color: primaryColor,
                        ),
                      ))
                ],
              ),
              // Container(
              //   height: 380,
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              //     child: ListView(
              //       scrollDirection: Axis.horizontal,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(right: 5),
              //           child: ProductCard(),
              //         ),
              //         ProductCard(),
              //         ProductCard(),
              //         ProductCard(),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: DetailBottomBar(),
    );
  }
}
