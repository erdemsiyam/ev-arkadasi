// ignore_for_file: unused_element

import 'package:ev_arkadasi/service/user_service.dart';
import 'package:ev_arkadasi/util/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  // Singleton
  UserRepository._singleton();
  static final UserRepository _instance = UserRepository._singleton();
  static UserRepository get instance => _instance;

  // Static Fields
  SharedPreferences? _sharedPreferences;
  static const String _uuidKey = "UUID";
  static const String _usernameKey = "USERNAME";
  static const String _accessTokenKey = "ACCESS_TOKEN";
  static const String _refreshTokenKey = "REFRESH_TOKEN";
  User? user;

  // Methods
  Future<User?> getUserAndToken() async {
    User? cacheUser = await _getUserFromCache();
    if (cacheUser == null) {
      return null;
    } else {
      if (cacheUser.refreshToken == null) {
        return null;
      } else {
        User? responseUser =
            await UserService.instance.refreshToken(cacheUser.refreshToken!);
        if (responseUser == null) {
          return null;
        } else {
          user = responseUser;
          _saveUserToCache(responseUser);
          return user;
        }
      }
    }
  }

  Future<User?> login(User loginUser) async {
    User? responseUser = await UserService.instance.login(loginUser);
    if (responseUser == null || responseUser.isEmpty()) {
      return null;
    } else {
      user = responseUser;
      _saveUserToCache(responseUser);
      return user;
    }
  }

  // Util Methods
  Future<User?> _getUserFromCache() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    User cacheUser = User();
    cacheUser.uuid = _sharedPreferences?.getString(_uuidKey);
    cacheUser.username = _sharedPreferences?.getString(_usernameKey);
    cacheUser.accessToken = _sharedPreferences?.getString(_accessTokenKey);
    cacheUser.refreshToken = _sharedPreferences?.getString(_refreshTokenKey);

    if (cacheUser.isEmpty()) {
      return null;
    } else {
      user = cacheUser;
      return user;
    }
  }

  _saveUserToCache(User newUser) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    user = newUser;
    if (user?.uuid != null) {
      _sharedPreferences?.setString(_uuidKey, user!.uuid!);
    }
    if (user?.username != null) {
      _sharedPreferences?.setString(_usernameKey, user!.username!);
    }
    if (user?.accessToken != null) {
      _sharedPreferences?.setString(_accessTokenKey, user!.accessToken!);
    }
    if (user?.refreshToken != null) {
      _sharedPreferences?.setString(_refreshTokenKey, user!.refreshToken!);
    }
  }

  _deleteUserFromCache() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences?.remove(_uuidKey);
    _sharedPreferences?.remove(_usernameKey);
    _sharedPreferences?.remove(_accessTokenKey);
    _sharedPreferences?.remove(_refreshTokenKey);
  }
}
