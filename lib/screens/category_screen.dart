import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/product_card.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/screens/product_tabs/beauty_tab.dart';
import 'package:pharma_app/screens/product_tabs/functional_products_tab.dart';
import 'package:pharma_app/screens/product_tabs/medical_equipment_tab.dart';
import 'package:pharma_app/screens/product_tabs/medicine_tab.dart';
import 'package:pharma_app/screens/product_tabs/mom_tab.dart';
import 'package:pharma_app/screens/product_tabs/personal_care_tab.dart';
import 'package:pharma_app/services/api.dart';
import 'package:pharma_app/widgets/filter_overlay.dart';
import 'package:pharma_app/widgets/search_category.dart';
import 'package:pharma_app/widgets/tab_bar_category.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  bool _showHintText = true;
  List<Product> _products = [];
  void _searchProducts(String query) async {
    var results = await Api.searchProduct(query);
    setState(() {
      _searchResults = results;
    });
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _showHintText = _searchController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // static double getScreenWidth(BuildContext context) {
  //   return MediaQuery.of(context).size.width;
  // }

  void _openFilterOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const FilterOverlay());
  }

  void _getProductsByCategory(String categoryId) async {
    List<Product> products = await Api.getProductsByCategoryId(categoryId);
    setState(() {
      _products = products;
    });
  }

  String name = '';

  @override
  Widget build(BuildContext context) {
    // double tabWidth = getScreenWidth(context) / 4;

    return DefaultTabController(
      length: 6,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          setState(() {
            _showHintText = _searchController.text.isEmpty;
          });
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(160),
            child: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Danh mục thuốc',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.textsms_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                    child: SearchCategory(),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              TabBarCategory(
                tabs: [
                  Tab(
                    child: Text('Thuốc'),
                    icon: Image.asset('assets/icons/medicine1.png'),
                  ),
                  Tab(
                    child: Text('Thực phẩm chức năng'),
                    icon: Image.asset('assets/icons/functionalproducts.png'),
                  ),
                  Tab(
                    child: Text('Chăm sóc cá nhân'),
                    icon: Image.asset('assets/icons/personalcare.png'),
                  ),
                  Tab(
                    child: Text('Mẹ và bé'),
                    icon: Image.asset('assets/icons/childrenandmom.png'),
                  ),
                  Tab(
                    child: Text('Sắc đẹp'),
                    icon: Image.asset('assets/icons/beauty.png'),
                  ),
                  Tab(
                    child: Text('Thiết bị y tế'),
                    icon: Image.asset('assets/icons/medicalequipment.png'),
                  ),
                ],
                
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(

                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(5),
                            side:
                                const BorderSide(width: 1, color: Color(0xff6F6F6F))),
                      ),
                      onPressed: _openFilterOverlay,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            IconlyLight.filter,
                            color: Color(0xff6F6F6F),
                          ),
                          Text(
                            'Bộ lọc',
                            style: TextStyle(
                              color: Color(0xff6F6F6F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    MedicineTab(),
                    FunctionalProductTab(),
                    PersonalCareTab(),
                    MomTab(),
                    BeautyTab(),
                    MedicalEquipmentTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildProductList(String category) {
  List<Widget> products = [
    // ProductCard(),
    //ProductCard(),
  ];

  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 8),
    children: [
      Row(
        children: products.map((product) => Expanded(child: product)).toList(),
      ),
      Row(
        children: products.map((product) => Expanded(child: product)).toList(),
      ),
    ],
  );
}