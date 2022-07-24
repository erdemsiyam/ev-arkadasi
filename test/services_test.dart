import 'package:ev_arkadasi/model/rent_model.dart';
import 'package:ev_arkadasi/service/rent/rent_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  // Auth
  // TODO: SIGNUP
  // TODO: TOKEN
  // TODO: REFRESH_TOKEN

  // User
  // TODO: GET_USER
  // TODO: USER_UPDATE
  // TODO: USER_IMAGE_ADD
  // TODO: USER_IMAGE_DELETE
  // TODO: USER_IMAGE_REORDER
  // Rent
  test('GET_RENT', () async {
    expect(
        await RentService.instance
            .getRent(rentUuid: "5a05a91a-0688-11ed-b939-0242ac120002"),
        isNot(null));
  });
  // TODO: RENT_SEARCH
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
