import 'package:ev_arkadasi/model/rent_model.dart';
import 'package:ev_arkadasi/service/rent/model/rent_search_response_model.dart';
import 'package:ev_arkadasi/service/rent/rent_service.dart';

class RentRepository {
  // Singleton
  RentRepository._singleton();
  static final RentRepository _instance = RentRepository._singleton();
  static RentRepository get instance => _instance;

  // Property
  List<Rent> rents = [];
  Rent? selectedRent;

  // Methods
  Future<List<Rent>> searchRent({
    required double latitude,
    required double longitude,
    double? latitudeDelta,
    double? longitudeDelta,
  }) async {
    rents.clear();
    RentSearchResponseModel? rsrm = await RentService.instance.searchRent(
        latitude: latitude,
        longitude: longitude,
        latitudeDelta: latitudeDelta,
        longitudeDelta: longitudeDelta);
    if (rsrm != null) {
      rents.addAll(rsrm.rents ?? []);
    }
    return rents;
  }

  Future<Rent?> getRent({required String rentUuid}) async {
    selectedRent = await RentService.instance.getRent(rentUuid: rentUuid);
    return selectedRent;
  }
}
