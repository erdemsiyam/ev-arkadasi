abstract class BaseModel {
  String toJson();
  fromJson(String jsonStr);
  fromMap(Map<String, dynamic> map);
}
