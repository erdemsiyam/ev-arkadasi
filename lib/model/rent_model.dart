import 'dart:convert';
import 'package:ev_arkadasi/model/image_model.dart';
import 'package:ev_arkadasi/util/base/base_model.dart';

class Rent extends BaseModel {
  Rent({
    this.uuid,
    this.userUuid,
    this.countryCode,
    this.title,
    this.latitude,
    this.longitude,
    this.createdDate,
    this.expirationDate,
    this.discountCoupon,
    this.price,
    this.personLivingCount,
    this.buildingAge,
    this.buildingType,
    this.spot,
    this.meterSquare,
    this.roomsCount,
    this.hallsCount,
    this.isFurnished,
    this.isFurnishedToNewPerson,
    this.sharedBathroom,
    this.sharedRoom,
    this.depositPrice,
    this.duesPrice,
    this.description,
    this.internet,
    this.fridge,
    this.washingMachine,
    this.dishwasher,
    this.tv,
    this.radiator,
    this.stove,
    this.busStop,
    this.subway,
    this.outdoorParking,
    this.parkingGarage,
    this.security,
    this.site,
    this.gym,
    this.elevator,
    this.swimmingPool,
    this.ageMin,
    this.ageMax,
    this.gender,
    this.jobStudent,
    this.jobWorker,
    this.jobSelfEmp,
    this.jobOfficer,
    this.jobTeacher,
    this.jobPrivateSectorEmp,
    this.jobPoliceArmy,
    this.smoke,
    this.alcohol,
    this.petCat,
    this.petDog,
    this.petBird,
    this.petOthers,
    this.vegan,
    this.child,
    this.images,
  });

  String? uuid;
  String? userUuid;
  String? countryCode;
  String? title;
  double? latitude;
  double? longitude;
  DateTime? createdDate;
  DateTime? expirationDate;
  String? discountCoupon;
  int? price;
  int? personLivingCount;
  int? buildingAge;
  int? buildingType;
  int? spot;
  int? meterSquare;
  int? roomsCount;
  int? hallsCount;
  bool? isFurnished;
  bool? isFurnishedToNewPerson;
  bool? sharedBathroom;
  bool? sharedRoom;
  int? depositPrice;
  int? duesPrice;
  String? description;
  bool? internet;
  bool? fridge;
  bool? washingMachine;
  bool? dishwasher;
  bool? tv;
  bool? radiator;
  bool? stove;
  bool? busStop;
  bool? subway;
  bool? outdoorParking;
  bool? parkingGarage;
  bool? security;
  bool? site;
  bool? gym;
  bool? elevator;
  bool? swimmingPool;
  int? ageMin;
  int? ageMax;
  int? gender;
  bool? jobStudent;
  bool? jobWorker;
  bool? jobSelfEmp;
  bool? jobOfficer;
  bool? jobTeacher;
  bool? jobPrivateSectorEmp;
  bool? jobPoliceArmy;
  bool? smoke;
  bool? alcohol;
  bool? petCat;
  bool? petDog;
  bool? petBird;
  bool? petOthers;
  bool? vegan;
  bool? child;
  List<Image>? images;

  @override
  String toJson() => json.encode({
        "uuid": uuid,
        "user_uuid": userUuid,
        "country_code": countryCode,
        "title": title,
        "latitude": latitude,
        "longitude": longitude,
        "created_date": createdDate?.toIso8601String() ?? "",
        "expiration_date": expirationDate?.toIso8601String() ?? "",
        "discount_coupon": discountCoupon,
        "price": price,
        "person_living_count": personLivingCount,
        "building_age": buildingAge,
        "building_type": buildingType,
        "spot": spot,
        "meter_square": meterSquare,
        "rooms_count": roomsCount,
        "halls_count": hallsCount,
        "is_furnished": isFurnished,
        "is_furnished_to_new_person": isFurnishedToNewPerson,
        "shared_bathroom": sharedBathroom,
        "shared_room": sharedRoom,
        "deposit_price": depositPrice,
        "dues_price": duesPrice,
        "description": description,
        "internet": internet,
        "fridge": fridge,
        "washing_machine": washingMachine,
        "dishwasher": dishwasher,
        "tv": tv,
        "radiator": radiator,
        "stove": stove,
        "bus_stop": busStop,
        "subway": subway,
        "outdoor_parking": outdoorParking,
        "parking_garage": parkingGarage,
        "security": security,
        "site": site,
        "gym": gym,
        "elevator": elevator,
        "swimming_pool": swimmingPool,
        "age_min": ageMin,
        "age_max": ageMax,
        "gender": gender,
        "job_student": jobStudent,
        "job_worker": jobWorker,
        "job_self_emp": jobSelfEmp,
        "job_officer": jobOfficer,
        "job_teacher": jobTeacher,
        "job_private_sector_emp": jobPrivateSectorEmp,
        "job_police_army": jobPoliceArmy,
        "smoke": smoke,
        "alcohol": alcohol,
        "pet_cat": petCat,
        "pet_dog": petDog,
        "pet_bird": petBird,
        "pet_others": petOthers,
        "vegan": vegan,
        "child": child,
        // "images": List<Image>.from((images == null)? [] : images!.map((x) => json.decode(x.toJson()))),
      });

  @override
  fromJson(String jsonStr) {
    fromMap(json.decode(jsonStr));
  }

  @override
  fromMap(Map<String, dynamic> map) {
    uuid = map["uuid"];
    userUuid = map["user_uuid"];
    countryCode = map["country_code"];
    title = map["title"];
    latitude = map["latitude"].toDouble();
    longitude = map["longitude"].toDouble();
    createdDate = DateTime.parse(map["created_date"]);
    expirationDate = DateTime.parse(map["expiration_date"]);
    discountCoupon = map["discount_coupon"];
    price = map["price"];
    personLivingCount = map["person_living_count"];
    buildingAge = map["building_age"];
    buildingType = map["building_type"];
    spot = map["spot"];
    meterSquare = map["meter_square"];
    roomsCount = map["rooms_count"];
    hallsCount = map["halls_count"];
    isFurnished = map["is_furnished"];
    isFurnishedToNewPerson = map["is_furnished_to_new_person"];
    sharedBathroom = map["shared_bathroom"];
    sharedRoom = map["shared_room"];
    depositPrice = map["deposit_price"];
    duesPrice = map["dues_price"];
    description = map["description"];
    internet = map["internet"];
    fridge = map["fridge"];
    washingMachine = map["washing_machine"];
    dishwasher = map["dishwasher"];
    tv = map["tv"];
    radiator = map["radiator"];
    stove = map["stove"];
    busStop = map["bus_stop"];
    subway = map["subway"];
    outdoorParking = map["outdoor_parking"];
    parkingGarage = map["parking_garage"];
    security = map["security"];
    site = map["site"];
    gym = map["gym"];
    elevator = map["elevator"];
    swimmingPool = map["swimming_pool"];
    ageMin = map["age_min"];
    ageMax = map["age_max"];
    gender = map["gender"];
    jobStudent = map["job_student"];
    jobWorker = map["job_worker"];
    jobSelfEmp = map["job_self_emp"];
    jobOfficer = map["job_officer"];
    jobTeacher = map["job_teacher"];
    jobPrivateSectorEmp = map["job_private_sector_emp"];
    jobPoliceArmy = map["job_police_army"];
    smoke = map["smoke"];
    alcohol = map["alcohol"];
    petCat = map["pet_cat"];
    petDog = map["pet_dog"];
    petBird = map["pet_bird"];
    petOthers = map["pet_others"];
    vegan = map["vegan"];
    child = map["child"];
    images = List<Image>.from(map["images"].map((x) => Image()..fromMap(x)));
  }
}
