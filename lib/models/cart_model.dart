// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pharma_app/models/cart_product_model.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/screens/cart/cart.dart';

class CartModel {
  final String idUser;
  final List<CartProduct> products;
  final int total;

  CartModel(
      {required this.idUser, required this.products, required this.total});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'products': products.map((x) => x.toMap()).toList(),
      'total': total,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      idUser: map['idUser'] ?? "",
      products: List<CartProduct>.from(
        (map['products'] ?? []).map<CartProduct>(
          (x) => CartProduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: map['total'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
