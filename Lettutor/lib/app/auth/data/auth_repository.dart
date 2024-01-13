import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lettutor/app/auth/data/token_repository.dart';
import 'package:lettutor/app/auth/domain/login_response.dart';
import 'package:lettutor/app/auth/domain/user.dart';
import 'package:lettutor/core/config/auth_config.dart';
import 'package:lettutor/core/data/local/local_secure_storage.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final AuthConfig authConfig;
  final FlutterSecureStorage secureStorage;
  final TokenRepository tokenRepository;
  final Dio dio;

  AuthRepository(
      {required this.authConfig, required this.secureStorage, required this.dio, required this.tokenRepository});

  Future<LoginResponse?> login(String email, String password) async {
    final response = await dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode != 200) {
      return null;
    }
    tokenRepository.saveAccessToken(response.data['tokens']['access']['token']);
    tokenRepository.saveRefreshToken(response.data['tokens']['refresh']['token']);

    return LoginResponse.fromJson(response.data);
  }

  Future<bool> signUp(String email, String password) async {
    final response = await dio.post(
      '/auth/register',
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  Future<void> signOut() async {
    await tokenRepository.saveAccessToken(null);
    await tokenRepository.saveRefreshToken(null);
  }

  Future<String> refreshToken() async {
    final response = await dio.post(
      '/auth/refresh-token',
      data: {
        'refreshToken': tokenRepository.loadRefreshToken,
        'timezone': 7,
      },
    );
    return response.data['tokens']['access'];
  }

  Future<String> forgotPassword(String email) async {
    late Response response;
    try {
      response = await dio.post(
        '/auth/forgotPassword',
        data: {
          'email': email,
        },
      );
    } on DioException catch (e) {
      return e.response!.data['message'] == 'Not found' ? 'Email not found' : e.response!.data['message'];
    }
    return response.data['message'];
  }


}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
      authConfig: ref.read(authConfigProvider),
      secureStorage: ref.read(secureStorageProvider),
      tokenRepository: ref.read(tokenRepositoryProvider),
      dio: ref.read(authDioProvider));
}

@riverpod
Future<bool> signup(SignupRef ref, String email, String password) async {
  final authRepository = ref.read(authRepositoryProvider);
  return await authRepository.signUp(email, password);
}

@riverpod
Future<String> forgotPassword(ForgotPasswordRef ref, String email) async {
  final authRepository = ref.read(authRepositoryProvider);
  return await authRepository.forgotPassword(email);
}
