// ignore_for_file: non_constant_identifier_names

import 'http_option.dart';
import 'service_path.dart';

class ServiceMethod {
  String servicePath;
  HttpOption httpOption;
  ServiceMethod._private(this.servicePath, this.httpOption);

  static ServiceMethod SIGNUP =
      ServiceMethod._private(ServicePath.SINGUP, HttpOption.POST);
  static ServiceMethod TOKEN =
      ServiceMethod._private(ServicePath.TOKEN, HttpOption.POST);
  static ServiceMethod REFRESH_TOKEN =
      ServiceMethod._private(ServicePath.REFRESH_TOKEN, HttpOption.GET);
  static ServiceMethod GET_PRODUCTS =
      ServiceMethod._private(ServicePath.PRODUCTS, HttpOption.GET);
  static ServiceMethod GET_CATEGORIES =
      ServiceMethod._private(ServicePath.CATEGORIES, HttpOption.GET);
  static ServiceMethod GET_PICTURE =
      ServiceMethod._private(ServicePath.PICTURE, HttpOption.GET);
  static ServiceMethod ADD_FAVORITE =
      ServiceMethod._private(ServicePath.FAVORITE, HttpOption.POST);
  static ServiceMethod DELETE_FAVORITE =
      ServiceMethod._private(ServicePath.FAVORITE, HttpOption.DELETE);
  static ServiceMethod GET_FAVORITES =
      ServiceMethod._private(ServicePath.FAVORITES, HttpOption.GET);
  static ServiceMethod GET_CART =
      ServiceMethod._private(ServicePath.CART, HttpOption.GET);
  static ServiceMethod ADD_CART_ITEM =
      ServiceMethod._private(ServicePath.CART, HttpOption.POST);
  static ServiceMethod DELETE_CART_ITEM =
      ServiceMethod._private(ServicePath.CART, HttpOption.DELETE);
}
