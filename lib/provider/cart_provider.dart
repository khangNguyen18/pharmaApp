import 'package:flutter/material.dart';
import 'package:pharma_app/models/cart_model.dart';
import 'package:pharma_app/models/user.dart';

class CartProvider extends ChangeNotifier {
  CartModel _cart = CartModel(
    idUser: '',
    products: [],
    total: 0,
    voucher: '',
    discountAmount: 0,
  );

  CartModel get cart => _cart;
  void setCart(String cart) {
    _cart = CartModel.fromJson(cart);
    notifyListeners();
  }

  void setUserFromModel(CartModel cart) {
    _cart = cart;
    notifyListeners();
  }

  void remove() {
    _cart = CartModel(
        idUser: '', products: [], total: 0, voucher: "", discountAmount: 0);
    notifyListeners();
  }
}
