import 'package:hakathon_with_mts/core/utils/logger.dart';

class AuthTokenSingleton {
  static AuthTokenSingleton? _instance;
  String? _token;

  AuthTokenSingleton._();

  static AuthTokenSingleton get instance {
    _instance ??= AuthTokenSingleton._();
    return _instance!;
  }

  String? get token => _token;

  set token(String? value) {
    logger.w(value);
    _token = value;
  }
}
