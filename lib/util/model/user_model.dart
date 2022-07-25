import 'dart:convert';

import 'package:ev_arkadasi/model/image_model.dart';
import 'package:ev_arkadasi/util/base/base_model.dart';

class User extends BaseModel {
  User({
    this.uuid,
    this.name,
    this.surname,
    this.countryCode,
    this.phone,
    this.smsCode,
    this.smsCodeExpirationDatetime,
    this.age,
    this.gender,
    this.job,
    this.registerDatetime,
    this.lastLoginDatetime,
    this.instagram,
    this.facebook,
    this.description,
    this.accessToken,
    this.refreshToken,
    this.images,
  });

  String? uuid;
  String? name;
  String? surname;
  String? countryCode;
  String? phone;
  String? smsCode;
  DateTime? smsCodeExpirationDatetime;
  int? age;
  int? gender;
  int? job;
  DateTime? registerDatetime;
  DateTime? lastLoginDatetime;
  String? instagram;
  String? facebook;
  String? description;
  String? accessToken;
  String? refreshToken;
  List<Image>? images;

  @override
  String toJson() => json.encode({
        "uuid": uuid,
        "name": name,
        "surname": surname,
        "country_code": countryCode,
        "phone": phone,
        "sms_code": smsCode,
        "sms_code_expiration_datetime":
            smsCodeExpirationDatetime?.toIso8601String() ?? "",
        "age": age,
        "gender": gender,
        "job": job,
        "register_datetime": registerDatetime?.toIso8601String() ?? "",
        "last_login_datetime": lastLoginDatetime?.toIso8601String() ?? "",
        "instagram": instagram,
        "facebook": facebook,
        "description": description,
        "access_token": accessToken,
        "refresh_token": refreshToken,
        // "images": List<Image>.from((images == null)? [] : images!.map((x) => json.decode(x.toJson()))),
      });

  @override
  fromJson(String jsonStr) {
    fromMap(json.decode(jsonStr));
  }

  bool isEmpty() {
    if (uuid == null ||
        phone == null ||
        refreshToken == null ||
        accessToken == null) return true;
    if (uuid!.isEmpty ||
        phone!.isEmpty ||
        refreshToken!.isEmpty ||
        accessToken!.isEmpty) return true;
    return false;
  }

  @override
  fromMap(Map<String, dynamic> map) {
    uuid = map["uuid"];
    name = map["name"];
    surname = map["surname"];
    countryCode = map["country_code"];
    phone = map["phone"];
    smsCode = map["sms_code"];
    smsCodeExpirationDatetime = (map["sms_code_expiration_datetime"] == null)
        ? null
        : DateTime.parse(map["sms_code_expiration_datetime"]);
    age = map["age"];
    gender = map["gender"];
    job = map["job"];
    registerDatetime = (map["register_datetime"] == null)
        ? null
        : DateTime.parse(map["register_datetime"]);
    lastLoginDatetime = (map["last_login_datetime"] == null)
        ? null
        : DateTime.parse(map["last_login_datetime"]);
    instagram = map["instagram"];
    facebook = map["facebook"];
    description = map["description"];
    accessToken = map["access_token"];
    refreshToken = map["refresh_token"];
    images = (map["images"] == null)
        ? null
        : List<Image>.from(map["images"].map((x) => Image()..fromMap(x)));
  }
}
