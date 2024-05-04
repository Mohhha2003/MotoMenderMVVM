class EndPoint {
  static String baseUrl = "http://10.0.2.2:800";
  //  AUTHENTICATION ENDPOINTS
  static String products = '/products';
  static String signIn = '/auth/login';
  static String signUp = '/auth/register';
  static String forgetPassword = '/auth/forgetPassword';
  static String resetPassword = '/auth/resetPassword';
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "message";
  static String email = "email";
  static String name = "name";
  static String password = "password";
  static String address = 'address';
  static String phone = 'phone';

  static String newPassword = 'newPassword';
  static String otp = 'otp';
}
