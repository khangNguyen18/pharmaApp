import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/main.dart';
import 'package:pharma_app/models/activeElement_model.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/screens/home_screen.dart';
import 'package:pharma_app/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static const baseUrl = "http://192.168.130.4:3001/";

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
        print("name" + userProvider.user.accesstoken);
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

  static postRegisterAuth(Map<String, String> rdata) async {
    print(rdata);
    var url = Uri.parse("${baseUrl}auth/register");

    try {
      http.Response res = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(rdata));
      if (res.statusCode == 200) {
        print(res.body);
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

  static addNewCart() async{

  }
}
