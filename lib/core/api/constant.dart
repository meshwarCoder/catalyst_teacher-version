class EndPoint {
  static final String baseUrl = 'https://catalystapi-production.up.railway.app/api';
  static final String signUp = '/teachers/signup';
  static final String login = '/teachers/login';
  static final String forgotPassword = '/teachers/forgot-password';
  static final String verifyCode = '/teachers/verify-reset-code';
  static final String resetPassword = '/teachers/reset-password';
}

class ApiKey {
  static String fullName = 'fullName';
  static String email = 'email';
  static String password = 'password';
}

class Body {
  static String fullName = 'fullName';
  static String email = 'email';
  static String password = 'password';
  static String code = 'code';
  static String newPassword = 'newPassword';
  static String resetToken = 'resetToken';
}
