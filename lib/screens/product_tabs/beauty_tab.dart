import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/components/product_card.dart';
import 'package:pharma_app/services/api.dart';

class BeautyTab extends StatelessWidget {
  const BeautyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.getProductsByCategoryId("Chăm sóc sắc đẹp"),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.52,
                  mainAxisSpacing: 6),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ProductCard(list: snapshot.data[index]);
              });
        }
      },
    );
  }
}