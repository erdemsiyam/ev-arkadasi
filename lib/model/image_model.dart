import 'dart:convert';
import 'package:ev_arkadasi/util/base/base_model.dart';

class Image extends BaseModel {
  Image({
    this.uuid,
    this.userUuid,
    this.rentUuid,
    this.index,
    this.bigUrl,
    this.smallUrl,
    this.createdDate,
  });

  String? uuid;
  String? userUuid;
  String? rentUuid;
  int? index;
  String? bigUrl;
  String? smallUrl;
  DateTime? createdDate;

  @override
  String toJson() => json.encode({
        "uuid": uuid,
        "user_uuid": userUuid,
        "rent_uuid": rentUuid,
        "index": index,
        "big_url": bigUrl,
        "small_url": smallUrl,
        "created_date": createdDate?.toIso8601String() ?? "",
      });

  @override
  fromJson(String jsonStr) {
    fromMap(json.decode(jsonStr));
  }

  @override
  fromMap(Map<String, dynamic> map) {
    uuid = map["uuid"];
    userUuid = map["user_uuid"];
    rentUuid = map["rent_uuid"];
    index = map["index"];
    bigUrl = map["big_url"];
    smallUrl = map["small_url"];
    createdDate = DateTime.parse(map["created_date"]);
  }
}
