// ignore_for_file: constant_identifier_names

class ServicePath {
  static const String URL = "http://127.0.0.1:8000";
  static const String INDEX = '/';
  // Auth
  static const String SINGUP = '/signup';
  static const String TOKEN = '/token';
  static const String REFRESH_TOKEN = '/refresh_token';
  // User
  static const String USER = '/user';
  static const String USER_UPDATE = '/user_update';
  static const String USER_IMAGE_ADD = '/user_image_add';
  static const String USER_IMAGE_DELETE = '/user_image_delete';
  static const String USER_IMAGE_REORDER = '/user_image_reorder';
  // Rent
  static const String RENT = '/rent';
  static const String RENT_SEARCH = '/rent_search';
  static const String RENT_CREATE = '/rent_create';
  static const String RENT_UPDATE = '/rent_update';
  static const String RENT_DELETE = '/rent_delete';
  static const String RENT_IMAGE_ADD = '/rent_image_add';
  static const String RENT_IMAGE_DELETE = '/rent_image_delete';
  static const String RENT_IMAGE_REORDER = '/rent_image_reorder';
  // Favorite
  static const String FAVORITE = '/favorite';
  static const String FAVORITE_ADD = '/favorite_add';
  static const String FAVORITE_DELETE = '/favorite_delete';
  // Images
  static const String IMAGES = '/images';
}
