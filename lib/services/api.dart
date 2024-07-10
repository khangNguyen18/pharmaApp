import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/models/activeElement_model.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static const baseUrl = "http://192.168.1.9:3001/";

  //post account
  static postLoginAuth(Map adata) async {
    print(adata);

    var url = Uri.parse("${baseUrl}auth/login");
    try {
      final res = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(adata));
      if (res.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            'tokenLogin', jsonDecode(res.body)['data']["accesstoken"]);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
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
        print(products.first.activeElement!.first ?? "alo");
        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
