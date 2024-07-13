import 'package:pharma_app/models/product_model.dart';

class CartProduct {
  final Product product;
  final double quantity;

  CartProduct(this.product, this.quantity);
  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct.fromJson(json);
}
