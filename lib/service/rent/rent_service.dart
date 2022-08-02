import 'package:ev_arkadasi/model/rent_model.dart';
import 'package:ev_arkadasi/service/rent/model/rent_search_response_model.dart';
import 'package:ev_arkadasi/util/base/base_service.dart';
import 'package:ev_arkadasi/util/constant/service_method.dart';

class RentService extends BaseService {
  // Singleton
  RentService._singleton();
  static final RentService _instance = RentService._singleton();
  static RentService get instance => _instance;

  // Methods
  Future<Rent?> getRent({required String rentUuid}) async {
    try {
      return await request<Rent, Rent>(
        responseModel: Rent(),
        serviceMethod: ServiceMethod.GET_RENT,
        query: "rent_uuid=$rentUuid",
      );
    } catch (e) {
      return null;
    }
  }

  Future<RentSearchResponseModel?> searchRent({
    required double latitude,
    required double longitude,
    double? latitudeDelta,
    double? longitudeDelta,
  }) async {
    String query = "";
    query += "latitude=$latitude";
    query += "&longitude=$longitude";
    if (latitudeDelta != null) {
      query += "&latitude_delta=${latitudeDelta.toString()}";
    }
    if (longitudeDelta != null) {
      query += "&longitude_delta=${longitudeDelta.toString()}";
    }
    try {
      return await request<RentSearchResponseModel, RentSearchResponseModel>(
        responseModel: RentSearchResponseModel(),
        serviceMethod: ServiceMethod.RENT_SEARCH,
        query: query,
      );
    } catch (e) {
      return null;
    }
  }

  Future<Rent?> rentCreate({
    required Rent rent,
  }) async {
    try {
      return await request<Rent, Rent>(
        requestModel: rent,
        responseModel: Rent(),
        serviceMethod: ServiceMethod.RENT_CREATE,
      );
    } catch (e) {
      return null;
    }
  }

  Future<Rent?> rentUpdate({
    required Rent rent,
  }) async {
    try {
      return await request<Rent, Rent>(
        requestModel: rent,
        responseModel: Rent(),
        serviceMethod: ServiceMethod.RENT_UPDATE,
      );
    } catch (e) {
      return null;
    }
  }

  Future<Rent?> rentDelete({
    required String rentUuid,
  }) async {
    try {
      return await request<Rent, Rent>(
        responseModel: Rent(),
        serviceMethod: ServiceMethod.RENT_DELETE,
        query: "rent_uuid=$rentUuid",
      );
    } catch (e) {
      return null;
    }
  }
}
