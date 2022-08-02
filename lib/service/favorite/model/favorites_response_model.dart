// To parse this JSON data, do
//
//     final favoritesResponseModel = favoritesResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:ev_arkadasi/model/favorite_model.dart';
import 'package:ev_arkadasi/util/base/base_model.dart';

class FavoritesResponseModel extends BaseModel {
  FavoritesResponseModel({
    this.favorites,
  });

  List<Favorite>? favorites;

  @override
  String toJson() => "";

  @override
  fromJson(String jsonStr) {
    favorites = List<Favorite>.from(
        json.decode(jsonStr).map((x) => Favorite()..fromMap(x)));
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return;
  }
}
