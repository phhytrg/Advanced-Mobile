import 'package:dio/dio.dart';

class AuthService {
  late Dio dio;
  AuthService({required this.dio});

  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return username == 'admin' && password == 'admin';
  }
}

enum AuthPath {
  login,
  forgotPassword,
  phoneLogin,
  signup,
  verifyAccount,
  googleLogin,
  facebookLogin,
  refreshToken,
  phoneRegister,
  sendOtp,
  activateViaOtp,
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
      case AuthPath.signup:
        return '/auth/register';
      case AuthPath.verifyAccount:
        return '/auth/verifyAccount';
      case AuthPath.googleLogin:
        return '/auth/google';
      case AuthPath.facebookLogin:
        return '/auth/facebook';
      case AuthPath.refreshToken:
        return '/auth/refresh-token';
      case AuthPath.phoneRegister:
        return '/auth/phone-register';
      case AuthPath.sendOtp:
        return '/verify/phone-auth-verify/create';
      case AuthPath.activateViaOtp:
        return '/verify/phone-auth-verify/activate';
    }
  }
}