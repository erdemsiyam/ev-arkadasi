// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:ev_arkadasi/util/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManagement {
  /* 
    NOT : init fonksiyonu mainde await olarak çağırılmalı
    WidgetsFlutterBinding.ensureInitialized();
    await UserManagement.instance.init();
  */

  // Constructor
  UserManagement._singleton();

  // Static Fields
  static final UserManagement _userManagement = UserManagement._singleton();
  static SharedPreferences? _sharedPreferences;
  static const String _uuidKey = "UUID";
  static const String _usernameKey = "USERNAME";
  static const String _accessTokenKey = "ACCESS_TOKEN";
  static const String _refreshTokenKey = "REFRESH_TOKEN";
  User? user;

  // Getter Setter
  static UserManagement get instance => _userManagement;

  // Methods
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  User? getUserFromCache() {
    if (_sharedPreferences == null) return null;
    user = User();
    user?.uuid = _sharedPreferences?.getString(_uuidKey);
    user?.username = _sharedPreferences?.getString(_usernameKey);
    user?.accessToken = _sharedPreferences?.getString(_accessTokenKey);
    user?.refreshToken = _sharedPreferences?.getString(_refreshTokenKey);
    return user;
  }

  saveUserToCache(User newUser) {
    if (_sharedPreferences == null) return;
    user = newUser;
    if (user?.uuid != null)
      _sharedPreferences?.setString(_uuidKey, user!.uuid!);
    if (user?.username != null)
      _sharedPreferences?.setString(_usernameKey, user!.username!);
    if (user?.accessToken != null)
      _sharedPreferences?.setString(_accessTokenKey, user!.accessToken!);
    if (user?.refreshToken != null)
      _sharedPreferences?.setString(_refreshTokenKey, user!.refreshToken!);
  }

  deleteUserFromCache() {
    if (_sharedPreferences == null) return;
    _sharedPreferences?.remove(_uuidKey);
    _sharedPreferences?.remove(_usernameKey);
    _sharedPreferences?.remove(_accessTokenKey);
    _sharedPreferences?.remove(_refreshTokenKey);
  }
}
