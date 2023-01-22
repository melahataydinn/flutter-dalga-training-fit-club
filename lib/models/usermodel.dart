import 'package:flutter/src/widgets/framework.dart';
import 'package:Deneme/pages/navigationin/egzersiz.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class UserModel {
  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.lastname,
      required this.username,
      this.admin = false});

  String name;
  String email;
  String password;
  String lastname;
  String username;
  bool admin;

  factory UserModel.fromJson(json) => UserModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      lastname: json["lastname"] ?? "",
      username: json["username"] ?? "",
      admin: json["admin"] ?? false);

  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "lastname":lastname,
      "username":username,
      "admin": admin,
    
    };
  }
}
