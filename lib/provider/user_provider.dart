import 'package:flutter/material.dart';
import 'package:pharma_app/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    accesstoken: '',
    password: '',
    city: "",
    district: "",
    ward: "",
    address: "",
    phone: "",
    birthDay: "",
    gender: "",
  );

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void remove() {
    _user = User(
      id: '',
      name: '',
      email: '',
      accesstoken: '',
      password: '',
      city: "",
      district: "",
      ward: "",
      address: "",
      phone: "",
      birthDay: "",
      gender: "",
    );
    notifyListeners();
  }
}
