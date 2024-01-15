import 'package:dio/dio.dart';
import 'package:lettutor/app/auth/data/auth_repository.dart';
import 'package:lettutor/app/auth/data/token_repository.dart';
import 'package:lettutor/core/dio/auth_interceptor.dart';
import 'package:lettutor/core/route/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref){
  return Dio(BaseOptions(
    baseUrl: "https://sandbox.api.lettutor.com/",
    headers: {
      "Content-Type": "application/json",
      // Hard code token
    },
  ))..interceptors.add(AuthenticationInterceptor(
    tokenRepository: ref.read(tokenRepositoryProvider),
    authRepository: ref.read(authRepositoryProvider),
  ));
}

@Riverpod(keepAlive: true)
Dio authDio(AuthDioRef ref){
  return Dio(BaseOptions(
    baseUrl: "https://sandbox.api.lettutor.com/",
    headers: {
      "Content-Type": "application/json",
      // Hard code token
    },
  ));
}