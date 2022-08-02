// ignore_for_file: non_constant_identifier_names

import 'http_option.dart';
import 'service_path.dart';

class ServiceMethod {
  String servicePath;
  HttpOption httpOption;
  ServiceMethod._private(this.servicePath, this.httpOption);

  // Auth
  static ServiceMethod SIGNUP =
      ServiceMethod._private(ServicePath.SINGUP, HttpOption.POST);
  static ServiceMethod TOKEN =
      ServiceMethod._private(ServicePath.TOKEN, HttpOption.POST);
  static ServiceMethod REFRESH_TOKEN =
      ServiceMethod._private(ServicePath.REFRESH_TOKEN, HttpOption.GET);
  // User
  static ServiceMethod GET_USER =
      ServiceMethod._private(ServicePath.USER, HttpOption.GET);
  static ServiceMethod USER_UPDATE =
      ServiceMethod._private(ServicePath.USER_UPDATE, HttpOption.PUT);
  static ServiceMethod USER_IMAGE_ADD =
      ServiceMethod._private(ServicePath.USER_IMAGE_ADD, HttpOption.POST);
  static ServiceMethod USER_IMAGE_DELETE =
      ServiceMethod._private(ServicePath.USER_IMAGE_DELETE, HttpOption.DELETE);
  static ServiceMethod USER_IMAGE_REORDER =
      ServiceMethod._private(ServicePath.USER_IMAGE_REORDER, HttpOption.PUT);
  // Rent
  static ServiceMethod GET_RENT =
      ServiceMethod._private(ServicePath.RENT, HttpOption.GET);
  static ServiceMethod RENT_SEARCH =
      ServiceMethod._private(ServicePath.RENT_SEARCH, HttpOption.GET);
  static ServiceMethod RENT_CREATE =
      ServiceMethod._private(ServicePath.RENT_CREATE, HttpOption.POST);
  static ServiceMethod RENT_UPDATE =
      ServiceMethod._private(ServicePath.RENT_UPDATE, HttpOption.PUT);
  static ServiceMethod RENT_DELETE =
      ServiceMethod._private(ServicePath.RENT_DELETE, HttpOption.DELETE);
  static ServiceMethod RENT_IMAGE_ADD =
      ServiceMethod._private(ServicePath.RENT_IMAGE_ADD, HttpOption.POST);
  static ServiceMethod RENT_IMAGE_DELETE =
      ServiceMethod._private(ServicePath.RENT_IMAGE_DELETE, HttpOption.DELETE);
  static ServiceMethod RENT_IMAGE_REORDER =
      ServiceMethod._private(ServicePath.RENT_IMAGE_REORDER, HttpOption.PUT);
  // Favorite
  static ServiceMethod GET_FAVORITE =
      ServiceMethod._private(ServicePath.FAVORITE, HttpOption.GET);
  static ServiceMethod FAVORITE_ADD =
      ServiceMethod._private(ServicePath.FAVORITE_ADD, HttpOption.POST);
  static ServiceMethod FAVORITE_DELETE =
      ServiceMethod._private(ServicePath.FAVORITE_DELETE, HttpOption.DELETE);
  // Image
  static ServiceMethod IMAGES =
      ServiceMethod._private(ServicePath.IMAGES, HttpOption.GET);
}
