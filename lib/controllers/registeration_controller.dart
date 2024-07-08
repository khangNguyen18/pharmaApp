import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/screens/home_screen.dart';
import 'package:pharma_app/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterationController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {"Content-Type": "application/json"};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.registerEmail);

      Map body = {
        "fullname": fullNameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        print(response.body);
        final json = jsonDecode(response.body);
        var token = json['data']['accesstoken'];
        print(token);
        final SharedPreferences? prefs = await _prefs;

        await prefs?.setString('accesstoken', token);
        fullNameController.clear();
        emailController.clear();
        passwordController.clear();
        Get.off(HomeScreen());
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text(
                  e.toString(),
                ),
              ],
            );
          });
    }
  }
}
