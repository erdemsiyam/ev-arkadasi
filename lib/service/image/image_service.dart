import 'package:ev_arkadasi/service/image/model/image_response_model.dart';
import 'package:ev_arkadasi/util/base/base_service.dart';
import 'package:ev_arkadasi/util/constant/service_method.dart';

class ImageService extends BaseService {
  // Singleton
  ImageService._singleton();
  static final ImageService _instance = ImageService._singleton();
  static ImageService get instance => _instance;

  // Methods
  Future<ImageResponseModel?> userImageAdd({required String filePath}) async {
    try {
      return await request<ImageResponseModel, ImageResponseModel>(
        responseModel: ImageResponseModel(),
        serviceMethod: ServiceMethod.USER_IMAGE_ADD,
        filePath: filePath,
      );
    } catch (e) {
      return null;
    }
  }
}
