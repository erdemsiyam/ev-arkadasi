import 'package:ev_arkadasi/util/base/base_service.dart';
import 'package:ev_arkadasi/util/constant/service_method.dart';
import 'package:ev_arkadasi/util/model/user_model.dart';

class UserService extends BaseService {
  // Singleton
  UserService._singleton();
  static final UserService _instance = UserService._singleton();
  static UserService get instance => _instance;

  // Owner User Methods
  Future<User?> refreshToken({required String refreshToken}) async {
    try {
      return await request<User, User>(
        responseModel: User(),
        serviceMethod: ServiceMethod.REFRESH_TOKEN,
        isRefreshToken: true,
      );
    } catch (e) {
      return null;
    }
  }

  Future<User?> login({required User user}) async {
    try {
      return await request<User, User>(
        requestModel: user,
        responseModel: User(),
        serviceMethod: ServiceMethod.TOKEN,
      );
    } catch (e) {
      return null;
    }
  }

  Future<User?> signUp({required User user}) async {
    try {
      return await request<User, User>(
        requestModel: user,
        responseModel: User(),
        serviceMethod: ServiceMethod.SIGNUP,
      );
    } catch (e) {
      return null;
    }
  }

  // Other Methods
  Future<User?> getUser({required String userUuid}) async {
    try {
      return await request<User, User>(
        responseModel: User(),
        serviceMethod: ServiceMethod.GET_USER,
        query: "user_uuid=$userUuid",
      );
    } catch (e) {
      return null;
    }
  }

  Future<User?> userUpdate({required User user}) async {
    try {
      return await request<User, User>(
        requestModel: user,
        responseModel: User(),
        serviceMethod: ServiceMethod.USER_UPDATE,
      );
    } catch (e) {
      return null;
    }
  }
}
