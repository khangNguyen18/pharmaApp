import 'package:pharma_app/models/cart_product_model.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/screens/cart/cart.dart';

class CartModel {
  final String idUser;
  final List<CartProduct> products;
  final int total;

  CartModel(this.idUser, this.products, this.total);
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      CartModel.fromJson(json);
}
