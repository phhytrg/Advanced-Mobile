import 'package:dio/dio.dart';

class AuthService {
  late Dio dio;

  AuthService({required this.dio});

  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return username == 'admin' && password == 'admin';
  }

  Future<void> resetPassword(String email) async{

  }
}

enum AuthPath {
  login,
  forgotPassword,
  phoneLogin,
  googleLogin,
  facebookLogin,
  refreshToken,
}

extension ServiceAuthPath on AuthPath {
  String getString() {
    switch (this) {
      case AuthPath.login:
        return '/auth/login';
      case AuthPath.forgotPassword:
        return '/user/forgotPassword';
      case AuthPath.phoneLogin:
        return '/auth/phone-login';
      case AuthPath.googleLogin:
        return '/auth/google';
      case AuthPath.facebookLogin:
        return '/auth/facebook';
      case AuthPath.refreshToken:
        return '/auth/refresh-token';
    }
  }
}