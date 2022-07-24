import 'dart:convert';
import 'package:ev_arkadasi/model/rent_model.dart';
import 'package:ev_arkadasi/util/base/base_model.dart';

class RentSearchResponseModel extends BaseModel {
  RentSearchResponseModel({
    this.rents,
  });

  List<Rent>? rents;

  @override
  String toJson() {
    return "";
  }

  @override
  fromJson(String jsonStr) {
    rents =
        List<Rent>.from(json.decode(jsonStr).map((x) => Rent()..fromMap(x)));
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return;
  }
}
