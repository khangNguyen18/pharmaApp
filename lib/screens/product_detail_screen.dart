import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/product_card.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/screens/cart/cart.dart';
import 'package:pharma_app/widgets/detail_bottom_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key, required this.list});

  Product list;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int pointImage = 0;
  bool _showMoreColumns = false;
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
            widget.list.photoUrl![pointImage].toString(),
          ),
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              Positioned(
                right: 0,
                bottom: 20,
                left: 24,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: 20,
                    ),
                    itemCount: widget.list.photoUrl!.length,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          pointImage = index;
                        });
                      },
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: EdgeInsets.all(8),
                        child: ClipRRect(
                          child: Image.network(
                            widget.list.photoUrl![index].toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              text: widget.list.title.toString(),
              size: 30,
              maxLines: 3,
              weight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: TextComponent(
              text:
                  '${NumberFormat.currency(locale: "vi").format(int.parse(widget.list.price.toString()))}/${widget.list.unit}'
                      .toString(),
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
                  text: 'Đã bán ${widget.list.sold}',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.list.activeElement != null &&
                  widget.list.activeElement!.isNotEmpty)
                Column(
                  children: widget.list.activeElement
                          ?.map((e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: TextComponent(
                                      text: 'Thành phần',
                                      isTitle: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextComponent(
                                      text: e.title.toString(),
                                      maxLines: 6,
                                      size: 20,
                                    ),
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: e.desc
                                              ?.map(
                                                (description) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: TextComponent(
                                                    text: "- ${description}",
                                                    maxLines: 6,
                                                    size: 20,
                                                  ),
                                                ),
                                              )
                                              .toList() ??
                                          [])
                                ],
                              ))
                          .toList() ??
                      [],
                ),
              if (widget.list.indication != null &&
                  widget.list.indication!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextComponent(
                        text: 'Chỉ định',
                        isTitle: true,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.list.indication
                              ?.map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextComponent(
                                    text: "- ${e.toString()}",
                                    maxLines: 6,
                                    size: 20,
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ],
                ),
              if (widget.list.contraindication != null &&
                  widget.list.contraindication!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextComponent(
                        text: 'Chống chỉ định',
                        isTitle: true,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.list.contraindication
                              ?.map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextComponent(
                                    text: "- ${e.toString()}",
                                    maxLines: 6,
                                    size: 20,
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ],
                ),
              if (widget.list.uses != null && widget.list.uses!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextComponent(
                        text: 'Công dụng',
                        isTitle: true,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.list.uses
                              ?.map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextComponent(
                                    text: "- ${e.toString()}",
                                    maxLines: 6,
                                    size: 20,
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ],
                ),
              if (_showMoreColumns)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.list.genderOfUse != null &&
                        widget.list.genderOfUse!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Giới tính sử dụng',
                              isTitle: true,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.list.genderOfUse
                                    ?.map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextComponent(
                                          text: "- ${e.toString()}",
                                          maxLines: 6,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (widget.list.ageOfUse != null &&
                        widget.list.ageOfUse!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Độ tuổi sử dụng',
                              isTitle: true,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.list.ageOfUse
                                    ?.map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextComponent(
                                          text: "- ${e.toString()}",
                                          maxLines: 6,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (widget.list.using != null &&
                        widget.list.using!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Cách sử dụng',
                              isTitle: true,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.list.using
                                    ?.map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextComponent(
                                          text: "- ${e.toString()}",
                                          maxLines: 6,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (widget.list.dosage != null &&
                        widget.list.dosage!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Liều dùng',
                              isTitle: true,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.list.dosage
                                    ?.map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextComponent(
                                          text: "- ${e.toString()}",
                                          maxLines: 6,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (widget.list.sideEffect != null &&
                        widget.list.sideEffect!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Tác dụng phụ',
                              isTitle: true,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.list.sideEffect
                                    ?.map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextComponent(
                                          text: "- ${e.toString()}",
                                          maxLines: 6,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (widget.list.careFul != null &&
                        widget.list.careFul!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Thận trọng',
                              isTitle: true,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.list.careFul
                                    ?.map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextComponent(
                                          text: "- ${e.toString()}",
                                          maxLines: 6,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (widget.list.drugInteractions != null &&
                        widget.list.drugInteractions!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text:
                                  'Tương tác thuốc (Những lưu ý khi dùng chung thuốc với thực phẩm hoặc thuốc khác)',
                              isTitle: true,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.list.drugInteractions
                                    ?.map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextComponent(
                                          text: "- ${e.toString()}",
                                          maxLines: 6,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (widget.list.recommendation != null &&
                        widget.list.recommendation!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Khuyến cáo',
                              isTitle: true,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.list.recommendation
                                    ?.map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextComponent(
                                          text: "- ${e.toString()}",
                                          maxLines: 6,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (widget.list.preserve != null &&
                        widget.list.preserve!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Bảo quản',
                              isTitle: true,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.list.preserve
                                    ?.map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextComponent(
                                          text: "- ${e.toString()}",
                                          maxLines: 6,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (widget.list.packing != null &&
                        widget.list.packing!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Quy cách đóng gói',
                              isTitle: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextComponent(
                              text: "- ${widget.list.packing.toString()}",
                              maxLines: 6,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    if (widget.list.producer != null &&
                        widget.list.producer!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextComponent(
                              text: 'Thương hiệu',
                              isTitle: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextComponent(
                              text: "- ${widget.list.producer.toString()}",
                              maxLines: 6,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _showMoreColumns = !_showMoreColumns;
                    });
                  },
                  child: Text(_showMoreColumns ? 'Ẩn bớt' : 'Xem thêm'),
                ),
              ),
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
