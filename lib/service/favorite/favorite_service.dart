import 'package:ev_arkadasi/model/favorite_model.dart';
import 'package:ev_arkadasi/service/favorite/model/favorites_response_model.dart';
import 'package:ev_arkadasi/service/image/model/image_response_model.dart';
import 'package:ev_arkadasi/util/base/base_service.dart';
import 'package:ev_arkadasi/util/constant/service_method.dart';

class FavoriteService extends BaseService {
  // Singleton
  FavoriteService._singleton();
  static final FavoriteService _instance = FavoriteService._singleton();
  static FavoriteService get instance => _instance;

  // Methods
  Future<FavoritesResponseModel?> getFavorites() async {
    try {
      return await request<FavoritesResponseModel, FavoritesResponseModel>(
        responseModel: FavoritesResponseModel(),
        serviceMethod: ServiceMethod.GET_FAVORITE,
      );
    } catch (e) {
      return null;
    }
  }

  Future<Favorite?> addFavorite({
    required String rentUuid,
  }) async {
    try {
      return await request<Favorite, Favorite>(
        responseModel: Favorite(),
        serviceMethod: ServiceMethod.FAVORITE_ADD,
        query: "rent_uuid=$rentUuid",
      );
    } catch (e) {
      return null;
    }
  }

  Future<Favorite?> deleteFavorite({
    required String rentUuid,
  }) async {
    try {
      return await request<Favorite, Favorite>(
        responseModel: Favorite(),
        serviceMethod: ServiceMethod.FAVORITE_DELETE,
        query: "rent_uuid=$rentUuid",
      );
    } catch (e) {
      return null;
    }
  }
}
