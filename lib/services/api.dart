import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.130.4/";

  //post account
  static postLoginAuth(Map adata) async {
    var url = Uri.parse("${baseUrl}auth/login");
    try {
      final res = await http.post(url, body: adata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static postRegisterAuth(Map<String,String> rdata) async {

    var url = Uri.parse("${baseUrl}auth/register");

    try {
      final res = await http.post(url, body: rdata);
      if (res.statusCode == 200) {
        //var data = jsonDecode(res.body.toString());
        //print(data);
        print(res.body);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
