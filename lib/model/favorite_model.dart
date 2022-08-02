// To parse this JSON data, do
//
//     final favoritesResponseModel = favoritesResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:ev_arkadasi/util/base/base_model.dart';

class Favorite extends BaseModel {
  Favorite({
    this.isError,
    this.errorMessage,
    this.userUuid,
    this.rentUuid,
  });

  bool? isError;
  String? errorMessage;
  String? userUuid;
  String? rentUuid;

  @override
  String toJson() => json.encode({
        "is_error": isError,
        "error_message": errorMessage,
        "user_uuid": userUuid,
        "rent_uuid": rentUuid,
      });

  @override
  fromJson(String jsonStr) {
    fromMap(json.decode(jsonStr));
  }

  @override
  fromMap(Map<String, dynamic> map) {
    isError = map["is_error"];
    errorMessage = map["error_message"];
    userUuid = map["user_uuid"];
    rentUuid = map["rent_uuid"];
  }
}
