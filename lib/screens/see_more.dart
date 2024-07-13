import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/product_card.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/services/api.dart';

class SeeMore extends StatelessWidget {
  SeeMore(
      {super.key,
      required this.title,
      this.isSale = false,
      this.isSold = false});
  String title;
  bool isSale;
  bool isSold;

  @override
  Widget build(BuildContext context) {
    if (isSale == true) {
      return Scaffold(
        appBar: AppBar(
          title: TextComponent(
            text: title,
            isTitle: true,
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: false,
          leading: IconComponent(
            icon: Icon(IconlyLight.arrow_left_2),
            onIconPress: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: Api.getProduct(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Product> pdata = snapshot.data;

                // Lọc các sản phẩm có discount > 0
                List<Product> discountedProducts =
                    pdata.where((product) => product.discount > 0).toList();

                // Sắp xếp các sản phẩm theo discount giảm dần
                discountedProducts
                    .sort((a, b) => b.discount.compareTo(a.discount));

                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.52,
                            mainAxisSpacing: 6),
                    itemCount: discountedProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(list: discountedProducts[index]);
                    });
              }
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: TextComponent(
            text: title,
            isTitle: true,
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: false,
          leading: IconComponent(
            icon: Icon(IconlyLight.arrow_left_2),
            onIconPress: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: Api.getProduct(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                
                List<Product> pdata = snapshot.data;
                // Lọc các sản phẩm có discount > 0
                List<Product> topSoldProducts =
                    pdata.where((product) => product.sold > 0).toList();

                // Sắp xếp các sản phẩm theo discount giảm dần
                topSoldProducts
                    .sort((a, b) => b.sold.compareTo(a.sold));

                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.52,
                            mainAxisSpacing: 6),
                    itemCount: topSoldProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(list: topSoldProducts[index]);
                    });
              }
            },
          ),
        ),
      );
    }
  }
}
