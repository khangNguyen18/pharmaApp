// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String accesstoken;
  final String password;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.accesstoken,
      required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'accesstoken': accesstoken,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? "",
      name: map["name"] ?? "",
      email: map['email'] ?? "",
      accesstoken: map['accesstoken'] ?? "",
      password: map['password'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
