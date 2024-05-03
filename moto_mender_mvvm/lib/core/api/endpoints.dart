class EndPoint {
  static String baseUrl = "http://10.0.2.2:800";
  //  AUTHENTICATION ENDPOINTS
  static String products = '/products';
  static String signIn = '/user/login';
  static String signUp = '/user/register';
  static String forgetPassword = '/user/forgetPassword';
  static String resetPassword = '/user/resetPassword';
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "message";
  static String email = "email";
  static String name = "name";
  static String password = "password";
  static String address = 'address';
  static String phone = 'phone';
}
