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

  Future<ImageResponseModel?> userImageReorder({
    required String imageUuid,
    required int newIndex,
  }) async {
    try {
      return await request<ImageResponseModel, ImageResponseModel>(
        responseModel: ImageResponseModel(),
        serviceMethod: ServiceMethod.USER_IMAGE_REORDER,
        query: "image_uuid=$imageUuid&new_index=$newIndex",
      );
    } catch (e) {
      return null;
    }
  }

  Future<ImageResponseModel?> userImageDelete({
    required String imageUuid,
  }) async {
    try {
      return await request<ImageResponseModel, ImageResponseModel>(
        responseModel: ImageResponseModel(),
        serviceMethod: ServiceMethod.USER_IMAGE_DELETE,
        query: "image_uuid=$imageUuid",
      );
    } catch (e) {
      return null;
    }
  }

  Future<ImageResponseModel?> rentImageAdd({
    required String rentUuid,
    required String filePath,
  }) async {
    try {
      return await request<ImageResponseModel, ImageResponseModel>(
          responseModel: ImageResponseModel(),
          serviceMethod: ServiceMethod.RENT_IMAGE_ADD,
          filePath: filePath,
          query: "rent_uuid=$rentUuid");
    } catch (e) {
      return null;
    }
  }

  Future<ImageResponseModel?> rentImageReorder({
    required String rentUuid,
    required String imageUuid,
    required int newIndex,
  }) async {
    try {
      return await request<ImageResponseModel, ImageResponseModel>(
        responseModel: ImageResponseModel(),
        serviceMethod: ServiceMethod.RENT_IMAGE_REORDER,
        query: "rent_uuid=$rentUuid&image_uuid=$imageUuid&new_index=$newIndex",
      );
    } catch (e) {
      return null;
    }
  }

  Future<ImageResponseModel?> rentImageDelete({
    required String rentUuid,
    required String imageUuid,
  }) async {
    try {
      return await request<ImageResponseModel, ImageResponseModel>(
        responseModel: ImageResponseModel(),
        serviceMethod: ServiceMethod.RENT_IMAGE_DELETE,
        query: "rent_uuid=$rentUuid&image_uuid=$imageUuid",
      );
    } catch (e) {
      return null;
    }
  }
}
