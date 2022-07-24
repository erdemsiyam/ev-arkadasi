// ignore_for_file: constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:ev_arkadasi/repository/user_repository.dart';
import 'package:ev_arkadasi/util/constant/http_option.dart';
import 'package:ev_arkadasi/util/constant/service_method.dart';
import 'package:ev_arkadasi/util/constant/service_path.dart';
import 'package:http/http.dart';
import 'base_model.dart';

class BaseService {
  bool isAuthEnable;

  BaseService({this.isAuthEnable = true});

  Future<K?> request<T extends BaseModel, K extends BaseModel>({
    T? requestModel,
    K? responseModel,
    required ServiceMethod serviceMethod,
    Map<String, String>? extraHeader,
    String? query,
    bool isRefreshToken = false,
  }) async {
    if (query != null) {
      query = "?" + query;
    }
    Response? response;
    Uri requestUri =
        Uri.parse(ServicePath.URL + serviceMethod.servicePath + (query ?? ""));

    Map<String, String> header = {};
    if (extraHeader != null) {
      header.addAll(extraHeader);
    }
    // Auth Token Adding To Header
    if (isAuthEnable) {
      if (isRefreshToken &&
          UserRepository.instance.user?.refreshToken != null) {
        header.addAll(
          {
            HttpHeaders.authorizationHeader:
                "Bearer " + UserRepository.instance.user!.refreshToken!
          },
        );
      } else if (UserRepository.instance.user?.accessToken != null) {
        header.addAll(
          {
            HttpHeaders.authorizationHeader:
                "Bearer " + UserRepository.instance.user!.accessToken!
          },
        );
      }
    }
    header.addAll({
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'charset=UTF-8',
    });

    // Body Adding
    String? requestBody;
    if (requestModel != null) {
      requestBody = requestModel.toJson();
    }

    switch (serviceMethod.httpOption) {
      case HttpOption.GET:
        response = await get(requestUri, headers: header);
        break;
      case HttpOption.POST:
        response = await post(
          requestUri,
          headers: header,
          body: requestBody,
        );
        break;
      case HttpOption.PUT:
        response = await put(
          requestUri,
          headers: header,
          body: requestBody,
        );
        break;
      case HttpOption.DELETE:
        response = await delete(
          requestUri,
          headers: header,
          body: requestBody,
        );
        break;
      default:
    }

    if (response == null) throw Exception('No Response');

    switch (response.statusCode) {
      case 200:
        if (responseModel != null) {
          // responseModel.fromJson(response.body);
          responseModel
              .fromJson(const Utf8Decoder().convert(response.bodyBytes));
          return responseModel;
        }
        return null;
      case 401:
        // TODO : Aşağıdaki yapı buradan bir şekilde kaldırılmalı
        // if (recursive && UserViewModel.instance != null) {
        //   if (await UserViewModel.instance!.retoken(UserManagement.user)) {
        //     return request<T, K>(
        //       serviceMethod: serviceMethod,
        //       extraHeader: extraHeader,
        //       responseModel: responseModel,
        //     );
        //   }
        // }
        // PageProvider.instance.changePage(PageName.LOGIN);
        throw Exception('Auth Error ');

      default:
        throw Exception('Response Error');
    }
  }
}
