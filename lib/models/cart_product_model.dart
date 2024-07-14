// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pharma_app/models/product_model.dart';

class CartProduct {
  final String productId;
  final int quantity;

  CartProduct({required this.productId, required this.quantity});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      productId: map['productId'] as String,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProduct.fromJson(String source) =>
      CartProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}
