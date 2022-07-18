import 'dart:convert';

import 'package:ev_arkadasi/util/base/base_model.dart';

class User extends BaseModel {
  User({
    this.uuid,
    this.username,
    this.email,
    this.password,
    this.accessToken,
    this.refreshToken,
  });

  String? uuid;
  String? username;
  String? email;
  String? password;
  String? accessToken;
  String? refreshToken;

  @override
  String toJson() => json.encode({
        "uuid": uuid,
        "username": username,
        "email": email,
        "password": password,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      });

  @override
  fromJson(String jsonStr) {
    fromMap(json.decode(jsonStr));
  }

  bool isEmpty() {
    if (uuid == null ||
        username == null ||
        refreshToken == null ||
        accessToken == null) return true;
    if (uuid!.isEmpty ||
        username!.isEmpty ||
        refreshToken!.isEmpty ||
        accessToken!.isEmpty) return true;
    return false;
  }

  @override
  fromMap(Map<String, dynamic> map) {
    uuid = map["uuid"];
    username = map["username"];
    email = map["email"];
    password = map["password"];
    accessToken = map["access_token"];
    refreshToken = map["refresh_token"];
  }
}
