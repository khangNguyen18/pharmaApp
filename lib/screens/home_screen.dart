import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/product_card.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/screens/cart/cart.dart';
import 'package:pharma_app/screens/discount_screen.dart';
import 'package:pharma_app/services/api.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List imgList = [
    'assets/images/carousel/carousel1.png',
    'assets/images/carousel/carousel2.jpg',
    'assets/images/carousel/carousel3.png',
    'assets/images/carousel/carousel4.jpg',
  ];
  int _currentPage = 0;

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        shadowColor: Colors.black,
        toolbarHeight: 160,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: CupertinoSearchTextField(
          controller: searchController,
          backgroundColor: Colors.white,
          autocorrect: false,
          onChanged: (_) {
            print(searchController.toString());
          },
        ),
        actions: [
          Row(
            children: [
              IconComponent(
                  icon: Icon(IconlyLight.chat),
                  iconBackgroundColor: null,
                  iconColor: Colors.white,
                  onIconPress: () {}),
              IconComponent(
                icon: Icon(
                  IconlyLight.buy,
                ),
                iconBackgroundColor: null,
                onIconPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                },
                iconColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: imgList
                    .map(
                      (e) => Image.asset(e),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 1,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 1,
                left: 200,
                child: buildCarouselIndicator(),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconComponent(
                      icon: FaIcon(FontAwesomeIcons.store),
                      iconColor: Theme.of(context).colorScheme.primary,
                      hasBorder: true,
                      size: 40,
                      onIconPress: () {},
                    ),
                    TextComponent(
                      text: 'Nhà thuốc',
                      size: 18,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconComponent(
                      iconColor: primaryColor,
                      icon: FaIcon(FontAwesomeIcons.userDoctor),
                      hasBorder: true,
                      size: 40,
                      onIconPress: () {},
                    ),
                    TextComponent(
                      text: 'Liên hệ dược sĩ',
                      size: 18,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconComponent(
                      iconColor: primaryColor,
                      icon: FaIcon(FontAwesomeIcons.calendar),
                      hasBorder: true,
                      size: 40,
                      onIconPress: () {},
                    ),
                    TextComponent(
                      text: 'Đặt lịch khám',
                      size: 18,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconComponent(
                      iconColor: primaryColor,
                      icon: Icon(Icons.discount_rounded),
                      hasBorder: true,
                      size: 40,
                      onIconPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiscountScreen(),
                          ),
                        );
                      },
                    ),
                    TextComponent(
                      text: 'Mã giảm giá',
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                height: 450,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      Color.fromARGB(255, 65, 221, 104),
                    ],
                    begin: Alignment(0, -1),
                    end: Alignment(0, 0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 60, 8, 20),
                  child: FutureBuilder(
                    future: Api.getProduct(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        List<Product> pdata = snapshot.data;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: pdata.length,
                          itemBuilder: (context, int index) {
                            return ProductCard(list: pdata[index]);
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              Positioned(
                child: ClipPath(
                  clipper: ClipTrapezoid(),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurStyle: BlurStyle.solid,
                          offset: Offset(4, 20),
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 65, 221, 104),
                          Colors.teal,
                        ],
                        begin: Alignment(-1, 0),
                        end: Alignment(1, 0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text.rich(
                            TextSpan(
                              text: 'Săn ',
                              style: GoogleFonts.markaziText(fontSize: 25),
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image:
                                          AssetImage('assets/icons/storm.png'),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Deal',
                                  style: GoogleFonts.markaziText(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // TextComponent(
                        //   text: '00:00:00',
                        //   size: 30,
                        //   color: Colors.white,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: TextButton(
                            onPressed: () {},
                            child: TextComponent(
                              text: 'Xem thêm',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Color.fromARGB(255, 219, 219, 219),
            thickness: 10,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextComponent(
                      text: 'Săn Deals Online',
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
              Container(
                height: 380,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 14),
                  child: FutureBuilder(
                    future: Api.getProduct(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        List<Product> pdata = snapshot.data;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: pdata.length,
                          itemBuilder: (context, int index) {
                            return ProductCard(list: pdata[index]);
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 10,
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
                    ),
                  ),
                ],
              ),
              Container(
                height: 380,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 14),
                  child: FutureBuilder(
                    future: Api.getProduct(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        List<Product> pdata = snapshot.data;

                        pdata.sort((a, b) => b.sold.compareTo(a.sold));
                        List<Product> topSoldProducts = pdata.take(2).toList();
                        // print('Top 2 products by sold:');
                        // topSoldProducts.forEach((product) {
                        //   return ProductCard(list: product);
                        // });

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: topSoldProducts.length,
                          itemBuilder: (context, int index) {
                            return ProductCard(list: topSoldProducts[index]);
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildCarouselIndicator() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < imgList.length; i++)
            Container(
              margin: const EdgeInsets.all(5),
              height: i == _currentPage ? 7 : 5,
              width: i == _currentPage ? 7 : 5,
              decoration: BoxDecoration(
                color: i == _currentPage
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Color.fromARGB(167, 255, 255, 255),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class ClipTrapezoid extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width * 0.95, height);
    path.lineTo(width * 0.05, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
