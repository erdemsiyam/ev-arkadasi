abstract class BaseModel {
  String toJson();
  //Map<T,K> toMap();
  fromJson(String jsonStr);
  fromMap(Map<String, dynamic> map);
}
