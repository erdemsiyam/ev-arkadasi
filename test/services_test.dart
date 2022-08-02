import 'package:ev_arkadasi/model/favorite_model.dart';
import 'package:ev_arkadasi/model/rent_model.dart';
import 'package:ev_arkadasi/repository/user_repository.dart';
import 'package:ev_arkadasi/service/favorite/favorite_service.dart';
import 'package:ev_arkadasi/service/favorite/model/favorites_response_model.dart';
import 'package:ev_arkadasi/service/image/image_service.dart';
import 'package:ev_arkadasi/service/image/model/image_response_model.dart';
import 'package:ev_arkadasi/service/rent/rent_service.dart';
import 'package:ev_arkadasi/service/user/user_service.dart';
import 'package:ev_arkadasi/util/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  // Auth
  test('SIGNUP', () async {
    User? response = await UserService.instance.signUp(
      user: User()
        ..fromMap(
          {
            "name": "Erdem",
            "surname": "Siyam",
            "country_code": "TR",
            "phone": "+905581327535",
            "sms_code": "1234",
            "sms_code_expiration_datetime": "2022-07-14 01:20:23",
            "age": 25,
            "gender": 1,
            "job": 1,
            "register_datetime": "2022-07-14 01:20:22",
            "last_login_datetime": "2022-07-14 01:20:22",
            "instagram": "erdemsym",
            "facebook": "erdemsym",
            "description":
                "Açıklamadır Açıklamadır Açıklamadır Açıklamadır Açıklamadır Açıklamadır Açıklamadır"
          },
        ),
    );
    UserRepository.instance.user = response;
    expect(response, isNot(null));
  });
  test('TOKEN', () async {
    User? user = User();
    user.phone = "+905511231234";
    user.smsCode = "1234";
    User? response = await UserService.instance.login(user: user);
    UserRepository.instance.user = response;
    expect(response, isNot(null));
  });
  test('REFRESH_TOKEN', () async {
    // await loginManuel();
    User? response = await UserService.instance.refreshToken(
        refreshToken: UserRepository.instance.user!.refreshToken!);
    UserRepository.instance.user = response;
    expect(response, isNot(null));
  });

  // User
  test('GET_USER', () async {
    // await loginManuel();
    var result = await UserService.instance
        .getUser(userUuid: "b99cc2d9-88bf-4a69-a878-0c1f9eff7b5b");
    expect(result, isNot(null));
  });
  test('USER_UPDATE', () async {
    // await loginManuel();
    User? myUser = UserRepository.instance.user;
    myUser!.name = "Ahmet Updated4";
    var result = await UserService.instance.userUpdate(user: myUser);
    expect(result, isNot(null));
    expect(result?.name, "Ahmet Updated4");
  });
  test('USER_IMAGE ADD / REORDER / DELETE', () async {
    // await loginManuel();
    // ADD
    ImageResponseModel? result = await ImageService.instance.userImageAdd(
      filePath:
          "/Users/erdem/Desktop/Projects/Ev Arkadasi/ev_arkadasi/test/test_picture.jpg",
    );
    expect(result!.uuid, isNot(null));
    // REORDER
    result = await ImageService.instance.userImageReorder(
      imageUuid: result.uuid!,
      newIndex: 2,
    );
    expect(result!.index, 2);
    // DELETE
    await ImageService.instance.userImageDelete(
      imageUuid: result.uuid!,
    );
  });

  // Rent
  test('GET_RENT', () async {
    var result = await RentService.instance
        .getRent(rentUuid: "5a05a91a-0688-11ed-b939-0242ac120002");
    expect(result, isNot(null));
  });
  test('RENT_SEARCH', () async {
    var result = await RentService.instance.searchRent(
      latitude: 41.040137,
      longitude: 28.879530,
    );
    expect(result, isNot(null));
  });
  test('RENT_CREATE', () async {
    // await loginManuel();
    Rent newRent = Rent()
      ..fromMap({
        "country_code": "TR",
        "title": "TEST 1",
        "latitude": 10.5,
        "longitude": 10.6,
        "price": 3000,
        "person_living_count": 1,
        "building_age": 7,
        "building_type": 1,
        "spot": 3,
        "meter_square": 120,
        "rooms_count": 2,
        "halls_count": 1,
        "is_furnished": true,
        "is_furnished_to_new_person": true,
        "shared_bathroom": true,
        "shared_room": false,
        "deposit_price": 6000,
        "dues_price": 300,
        "description": "Açıklama test",
        "internet": true,
        "fridge": true,
        "washing_machine": true,
        "dishwasher": true,
        "tv": true,
        "radiator": true,
        "stove": false,
        "bus_stop": true,
        "subway": false,
        "outdoor_parking": true,
        "parking_garage": true,
        "security": true,
        "site": true,
        "gym": true,
        "elevator": true,
        "swimming_pool": true,
        "age_min": 18,
        "age_max": 34,
        "gender": 0,
        "job_student": true,
        "job_worker": true,
        "job_self_emp": true,
        "job_officer": true,
        "job_teacher": true,
        "job_private_sector_emp": true,
        "job_police_army": true,
        "smoke": true,
        "alcohol": true,
        "pet_cat": true,
        "pet_dog": true,
        "pet_bird": true,
        "pet_others": true,
        "vegan": false,
        "child": false,
        // "images": List<Image>.from((images == null)? [] : images!.map((x) => json.decode(x.toJson()))),
      });
    Rent? rentResult = await RentService.instance.rentCreate(rent: newRent);
    expect(rentResult, isNot(null));
    expect(rentResult!.uuid, isNot(null));
  });
  test('RENT_UPDATE', () async {
    // await loginManuel();
    Rent? rentSelected = await RentService.instance
        .getRent(rentUuid: "055dc3fc-0683-11ed-b939-0242ac120002");
    rentSelected!.description = "test updated";
    Rent? rentResult =
        await RentService.instance.rentUpdate(rent: rentSelected);
    expect(rentResult!.description, "test updated");
  });
  test('RENT_IMAGE ADD / REORDER / DELETE', () async {
    // await loginManuel();
    // ADD
    ImageResponseModel? rentImageResult =
        await ImageService.instance.rentImageAdd(
      rentUuid: "055dc3fc-0683-11ed-b939-0242ac120002",
      filePath:
          "/Users/erdem/Desktop/Projects/Ev Arkadasi/ev_arkadasi/test/test_picture.jpg",
    );
    expect(rentImageResult!.uuid, isNot(null));
    // REORDER
    rentImageResult = await ImageService.instance.rentImageReorder(
      rentUuid: "055dc3fc-0683-11ed-b939-0242ac120002",
      imageUuid: rentImageResult.uuid!,
      newIndex: 1,
    );
    expect(rentImageResult!.index, 1);
    // DELETE
    rentImageResult = await ImageService.instance.rentImageDelete(
      rentUuid: "055dc3fc-0683-11ed-b939-0242ac120002",
      imageUuid: rentImageResult.uuid!,
    );
    expect(rentImageResult!.isError, false);
  });
  test('RENT_DELETE', () async {
    // await loginManuel();
    Rent? rentResult = await RentService.instance
        .rentDelete(rentUuid: "055dc3fc-0683-11ed-b939-0242ac120002");
    expect(rentResult!.isError, false);
  });

  // Favorite
  test('GET_FAVORITE', () async {
    // await loginManuel();
    FavoritesResponseModel? frmResult =
        await FavoriteService.instance.getFavorites();
    expect(frmResult!.favorites!.length, 2);
  });
  // 1dde1694-0687-11ed-b939-0242ac120002
  test('FAVORITE_ADD / DELETE', () async {
    // await loginManuel();
    Favorite? favoriteResult = await FavoriteService.instance.addFavorite(
      rentUuid: "1dde1694-0687-11ed-b939-0242ac120002",
    );
    expect(favoriteResult!.isError, false);
    favoriteResult = await FavoriteService.instance.deleteFavorite(
      rentUuid: "1dde1694-0687-11ed-b939-0242ac120002",
    );
    expect(favoriteResult!.isError, false);
  });
}

Future<User?> loginManuel() async {
  // User Manuel Login START
  User? user = User();
  user.phone = "+905511231234";
  user.smsCode = "1234";
  user = await UserService.instance.login(user: user);
  UserRepository.instance.user = user;
  // User Manuel Login END
  return user;
}
