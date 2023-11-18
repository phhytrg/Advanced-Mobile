import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/login/data/auth_repository.dart';

import '../../../core/domain/user.dart';

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

class LoginService{
  LoginService(this.ref);
  final Ref ref;
  // final AuthRepository authRepository;
  //
  // LoginService({required this.authRepository});

  Future<User?> login(String email, String password) async{
    return await ref.read(authRepositoryProvider).login(email, password);
  }
}

final loginServiceProvider = Provider<LoginService>((ref) {
  // return a concrete implementation of AuthRepository
  return LoginService(ref);
});