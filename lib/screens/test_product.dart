import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/services/api.dart';

class TestProduct extends StatefulWidget {
  const TestProduct({super.key});

  @override
  State<TestProduct> createState() => _TestProductState();
}

class _TestProductState extends State<TestProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            print(snapshot.data);
            return ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text("${snapshot.data[index]}"),
                  );
                });
          }
        },
      ),
    );
  }
}
