class ApiEndpoints {
  // ignore: prefer_const_declarations
  static final String baseUrl = 'http://192.168.130.4/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'auth/login';
  final String loginEmail = 'auth/register';
}