import 'package:ev_arkadasi/model/rent_model.dart';
import 'package:ev_arkadasi/repository/user_repository.dart';
import 'package:ev_arkadasi/service/image/image_service.dart';
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
  // TODO: USER_IMAGE_ADD
  test('USER_IMAGE_ADD', () async {
    User? myUser = await loginManuel();
    var result = await ImageService.instance.userImageAdd(
      filePath:
          "/Users/erdem/Desktop/Projects/Ev Arkadasi/ev_arkadasi/test/test_picture.jpg",
    );
    expect(result!.uuid, isNot(null));
  });
  // TODO: USER_IMAGE_DELETE
  // TODO: USER_IMAGE_REORDER

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
  // TODO: RENT_CREATE
  // TODO: RENT_UPDATE
  // TODO: RENT_DELETE
  // TODO: RENT_IMAGE_ADD
  // TODO: RENT_IMAGE_DELETE
  // TODO: RENT_IMAGE_REORDER

  // Favorite
  // TODO: FAVORITE
  // TODO: FAVORITE_ADD
  // TODO: FAVORITE_DELETE

  // Image
  // TODO: IMAGES
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
