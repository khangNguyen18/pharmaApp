import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/main.dart';
import 'package:pharma_app/models/activeElement_model.dart';
import 'package:pharma_app/models/cart_model.dart';
import 'package:pharma_app/models/cart_product_model.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/provider/cart_provider.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static const baseUrl = "http://192.168.1.5:3001/";

  //post account
  static postLoginAuth(
      {required BuildContext context,
      required String email,
      required String password}) async {
    var url = Uri.parse("${baseUrl}auth/login");
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"email": email, "password": password}));
      if (res.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        var jsonResponse = jsonDecode(res.body);
        userProvider.setUser(res.body);
        await getCart(jsonResponse["id"], context);
        navigator.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyApp()), (route) => false);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static verification(BuildContext context, String email) async {
    var url = Uri.parse("${baseUrl}auth/verification");
    try {
      http.Response res = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"email": email}));
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body);
        return jsonResponse["data"]["code"];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.remove();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
      (route) => false,
    );
  }

  static postRegisterAuth(
      Map<String, String> rdata, BuildContext context) async {
    print(rdata);
    var url = Uri.parse("${baseUrl}auth/register");
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    final navigator = Navigator.of(context);
    try {
      http.Response res = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(rdata));
      if (res.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var jsonResponse = jsonDecode(res.body);
        userProvider.setUser(res.body);
        await prefs.setString('tokenLogin', jsonResponse["accesstoken"]);
        navigator.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyApp()), (route) => false);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getProduct() async {
    List<Product> products = [];
    List<ActiveElementModel> activeElement = [];
    var url = Uri.parse("${baseUrl}product/get-products");
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        // data["data"].forEach(
        //   (value) => {
        //     value["activeElement"].forEach((item) => {
        //           activeElement
        //               .add(ActiveElementModel(item["title"], [...item["desc"]]))
        //         })
        //   },
        // );
        data['data'].forEach(
          (value) => {
            value["activeElement"].forEach((item) => {
                  activeElement
                      .add(ActiveElementModel(item["title"], [...item["desc"]]))
                }),
            products.add(
              Product(
                value["_id"],
                value["title"],
                value["desc"],
                [...value["photoUrl"]],
                value["sold"] ?? 0,
                value["discount"] ?? 0,
                value["price"] ?? 0,
                [...value["categories"]],
                [...value["subCategories"]],
                [...value["subSubCategories"]],
                [...value["indication"]],
                [...value["contraindication"]],
                [...value["dosage"]],
                [...value["uses"]],
                activeElement,
                value["producer"],
                value["packing"],
                [...value["sideEffect"]],
                [...value["careFul"]],
                [...value["drugInteractions"]],
                [...value["ageOfUse"]],
                [...value["genderOfUse"]],
                [...value["using"]],
                [...value["recommendation"]],
                [...value["preserve"]],
                value["unit"],
              ),
            ),
            activeElement = []
          },
        );
        print(products.first.activeElement!.first ?? "alo");
        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static searchProduct(String title) async {
    List<Product> products = [];
    List<ActiveElementModel> activeElement = [];
    var url = Uri.parse("${baseUrl}product/search-products?title=${title}");
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        data["data"].forEach(
          (value) => {
            value["activeElement"].forEach((item) => {
                  activeElement
                      .add(ActiveElementModel(item["title"], [...item["desc"]]))
                })
          },
        );
        data['data'].forEach(
          (value) => {
            products.add(Product(
                value["_id"],
                value["title"],
                value["desc"],
                [...value["photoUrl"]],
                value["sold"] ?? 0,
                value["discount"] ?? 0,
                value["price"] ?? 0,
                [...value["categories"]],
                [...value["subCategories"]],
                [...value["subSubCategories"]],
                [...value["indication"]],
                [...value["contraindication"]],
                [...value["dosage"]],
                [...value["uses"]],
                activeElement,
                value["producer"],
                value["packing"],
                [...value["sideEffect"]],
                [...value["careFul"]],
                [...value["drugInteractions"]],
                [...value["ageOfUse"]],
                [...value["genderOfUse"]],
                [...value["using"]],
                [...value["recommendation"]],
                [...value["preserve"]],
                value["unit"])),
          },
        );
        print("From api : " + products.length.toString());
        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static getProductsByCategoryId(String categoryId) async {
    List<Product> products = [];
    List<ActiveElementModel> activeElement = [];
    var url = Uri.parse(
        "${baseUrl}product/get-products-by-categoryid?id=$categoryId");
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        data["data"].forEach(
          (value) => {
            value["activeElement"].forEach((item) => {
                  activeElement
                      .add(ActiveElementModel(item["title"], [...item["desc"]]))
                })
          },
        );
        data['data'].forEach(
          (value) => {
            products.add(Product(
                value["_id"],
                value["title"],
                value["desc"],
                [...value["photoUrl"]],
                value["sold"] ?? 0,
                value["discount"] ?? 0,
                value["price"] ?? 0,
                [...value["categories"]],
                [...value["subCategories"]],
                [...value["subSubCategories"]],
                [...value["indication"]],
                [...value["contraindication"]],
                [...value["dosage"]],
                [...value["uses"]],
                activeElement,
                value["producer"],
                value["packing"],
                [...value["sideEffect"]],
                [...value["careFul"]],
                [...value["drugInteractions"]],
                [...value["ageOfUse"]],
                [...value["genderOfUse"]],
                [...value["using"]],
                [...value["recommendation"]],
                [...value["preserve"]],
                value["unit"])),
          },
        );
        print(products);
        return products;
      } else {
        print("error");

        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static getProductById(String id) async {
    print(1);
    Product products;
    List<ActiveElementModel> activeElement = [];
    var url = Uri.parse("${baseUrl}product/get-product-by-id?id=$id");
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data["data"]["activeElement"].forEach((item) => {
              activeElement
                  .add(ActiveElementModel(item["title"], [...item["desc"]]))
            });

        products = new Product(
            data['data']["_id"],
            data['data']["title"],
            data['data']["desc"],
            [...data['data']["photoUrl"]],
            data['data']["sold"] ?? 0,
            data['data']["discount"] ?? 0,
            data['data']["price"] ?? 0,
            [...data['data']["categories"]],
            [...data['data']["subCategories"]],
            [...data['data']["subSubCategories"]],
            [...data['data']["indication"]],
            [...data['data']["contraindication"]],
            [...data['data']["dosage"]],
            [...data['data']["uses"]],
            activeElement,
            data['data']["producer"],
            data['data']["packing"],
            [...data['data']["sideEffect"]],
            [...data['data']["careFul"]],
            [...data['data']["drugInteractions"]],
            [...data['data']["ageOfUse"]],
            [...data['data']["genderOfUse"]],
            [...data['data']["using"]],
            [...data['data']["recommendation"]],
            [...data['data']["preserve"]],
            data['data']["unit"]);
        return products;
      } else {
        print("error");

        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static putToCart(
      Map<String, Object> cartProduct, BuildContext context) async {
    var url = Uri.parse("${baseUrl}cart/PutItemToCart");
    try {
      var cartProvider = Provider.of<CartProvider>(context, listen: false);
      http.Response res = await http.put(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(cartProduct),
      );
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body);
        cartProvider.setCart(res.body);
      } else {
        print("Failed to add to cart. Status code: ${res.statusCode}");
      }
    } catch (e) {
      // Xử lý khi có lỗi trong quá trình gửi yêu cầu
      print('Error: $e');
    }
  }

  static getCart(String id, BuildContext context) async {
    CartModel cart;
    List<CartProduct> cartProduct = [];
    var url = Uri.parse("${baseUrl}cart/GetCartById?id=${id}");
    try {
      var cartProvider = Provider.of<CartProvider>(context, listen: false);
      http.Response res = await http.get(
        url,
      );
      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body);
        cartProvider.setCart(res.body);
        jsonResponse["products"].forEach((value) => cartProduct.add(
              CartProduct(
                  productId: value["productId"], quantity: value["quantity"]),
            ));
        cart = CartModel(
            idUser: jsonResponse["idUser"],
            products: cartProduct,
            total: jsonResponse["total"]);
        return cart;
      } else {
        print("Failed to add to cart. Status code: ${res.statusCode}");
      }
    } catch (e) {
      // Xử lý khi có lỗi trong quá trình gửi yêu cầu
      print('Error: $e');
    }
  }
}
