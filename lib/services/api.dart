import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static const baseUrl = "http://192.168.130.4/";

  


  //post account
  static Future<void> postLoginAuth(Map adata) async {
    print(adata);
    
    var url = Uri.parse("${baseUrl}auth/login");
    try {
      final res = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(adata));
      if (res.statusCode == 200) {
        print(res.body);
        var token = jsonDecode(res.body)['data']['accesstoken'];
        debugPrint('this is token $token');
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> postRegisterAuth(Map<String, String> rdata) async {
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
}
