import 'package:pharma_app/models/cart_product_model.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/screens/cart/cart.dart';

class CartModel {
  final String fullname;
  final String email;
  final List<CartProduct> products;

  CartModel(this.fullname, this.email, this.products);
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel.fromJson(json);
}

// extension CartExt on CartModel {
//   double get grandTotal {
//     return buildProductList(category);
//   }
//}