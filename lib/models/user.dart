// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String accesstoken;
  final String phone;
  final String birthDay;
  final String gender;
  final String password;
  final String city;
  final String district;
  final String ward;
  final String address;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.accesstoken,
      required this.password,
      required this.city,
      required this.district,
      required this.ward,
      required this.address,
      required this.birthDay,
      required this.gender,
      required this.phone});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'accesstoken': accesstoken,
      'password': password,
      'gender': gender,
      'address': address,
      'phone': phone,
      'birthDay': birthDay
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? "",
      name: map["name"] ?? "",
      email: map['email'] ?? "",
      accesstoken: map['accesstoken'] ?? "",
      password: map['password'] ?? "",
      birthDay: map["birthDay"] ?? "",
      phone: map["phone"] ?? "",
      city: map["city"] ?? "",
      district: map["district"] ?? "",
      ward: map["ward"] ?? "",
      address: map["address"] ?? "",
      gender: map["gender"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
