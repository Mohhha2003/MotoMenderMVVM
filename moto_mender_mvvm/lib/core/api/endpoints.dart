class EndPoint {
  static String baseUrl = "http://10.0.2.2:800";
  //  AUTHENTICATION ENDPOINTS
  static String signIn = '/auth/login';
  static String signUp = '/auth/register';
  static String forgetPassword = '/auth/forgetPassword';
  static String resetPassword = '/auth/resetPassword';
  static String verfiyEmail = '/auth/verfiyEmail';
  static String updateAccount = '/auth/updateAccount';
  //  FAVORITES ENDPOINTS
  static String getAllFavorties =
      '/favourites/getFavoriteProducts/:userId/favoriteProducts';
  static String addFavorite = '/favourites/addToFavorites';
  static String deleteFavorite = '/favourites/removeFromFavorites';
  //  PRODUCT ENDPONITS
  static String products = '/products';
  //   ORDER ENDPOINTS
  static String orders = '/orders';
  static String getAllOrders = '/orders/';
  static String placeNewOrder = '/orders/';
  static String getUserOrders = '/orders/:id';
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "message";
  static String email = "email";
  static String name = "name";
  static String password = "password";
  static String address = 'address';
  static String phone = 'phone';

  static String id = "id";
  static String isVerified = "isVerified";
  static String newPassword = 'newPassword';
  static String otp = 'otp';
  static String userId = 'userId';
  static String productId = 'productId';
  static String quantity = 'quantity';

  static String orderProducts = 'products';
}
