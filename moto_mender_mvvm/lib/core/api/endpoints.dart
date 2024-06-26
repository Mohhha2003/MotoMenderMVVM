class EndPoint {
  static String baseUrl = "http://192.168.1.17:800";
  //  AUTHENTICATION ENDPOINTS
  static String signIn = '/auth/login';
  static String signUp = '/auth/register';
  static String forgetPassword = '/auth/forgetPassword';
  static String resetPassword = '/auth/resetPassword';
  static String verfiyEmail = '/auth/verfiyEmail';
  static String updateAccount = '/auth/updateAccount';
  static String googleSignIn = '/auth/google';
  static String logOut = '/auth/logout';
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
  static String getUserOrders = '/orders/user';
  // CART ENDPOINTS
  static String addToCart = '/cart';
  static String getCartProdcuts = '/cart';
  static String removeCartProduct = '/cart';
  static String incrementQuantity = '/cart/products/increment';
  static String decrementQuantity = '/cart/products/decrement';
  //  SUPPORT ENPOINTS
  static String creatChatRoom = '/Support/create';
  static String sendMessage = '/Support/send';
  static String getChatRoomMessages = '/Support/get';
}

class ApiKey {
  // GLOBAL KEYS
  static String status = "status";
  static String errorMessage = "message";
  static String email = "email";
  static String name = "name";
  static String password = "password";
  static String address = 'address';
  static String phone = 'phone';
  static String adminId = 'adminId';
  // AUTH KEYS
  static String id = "id";
  static String isVerified = "isVerified";
  static String newPassword = 'newPassword';
  static String otp = 'otp';
  static String userId = 'userId';
  static String productId = 'productId';
  static String quantity = 'quantity';
  // ORDERS KEYS
  static String orderProducts = 'products';
  //   SUPPORT KEYS
  static String senderId = 'senderId';
  static String reciverId = 'receiverId';
  static String content = 'content';
  static String chatRoomId = 'chatRoomId';
  // SOCKET STATES KEYS
  static String message = 'message';
  static String typing = 'typing';
  static String stopTyping = 'stopTyping';
  static String disconnect = 'disconnect';
  static String adminActive = 'adminActive';
}
