import 'package:dio/dio.dart';
import 'package:lettutor/app/auth/data/auth_repository.dart';
import 'package:lettutor/app/auth/data/token_repository.dart';

class AuthenticationInterceptor extends QueuedInterceptorsWrapper {
  final TokenRepository tokenRepository;
  final AuthRepository authRepository;

  AuthenticationInterceptor({required this.tokenRepository, required this.authRepository});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await tokenRepository.loadAccessToken;
    if (accessToken != null) {
      options.headers.addAll(
        <String, String>{
          'Authorization': 'Bearer $accessToken',
        },
      );
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String? refreshToken = await tokenRepository.loadRefreshToken;
      if(refreshToken == null || tokenRepository.tokenHasExpired(refreshToken)){
        await authRepository.signOut();
        return handler.next(err);
      }
      if (!tokenRepository.tokenHasExpired(refreshToken)) {
        return handler.next(err);
      }
    //   try {
    //     String newAccessToken = await authRepository.refreshToken();
    //     tokenRepository.saveAccessToken(newAccessToken);
    //     final RequestOptions requestOptions = err.response!.requestOptions;
    //     requestOptions.headers['Authorization'] =
    //     'Bearer $newAccessToken';
    //     final options = Options(
    //       method: requestOptions.method,
    //       headers: requestOptions.headers,
    //     );
    //     final Dio dioRefresh = Dio(
    //       BaseOptions(
    //         baseUrl: requestOptions.baseUrl,
    //         headers: <String, String>{
    //           'accept': 'application/json',
    //         },
    //       ),
    //     );
    //     final response = await dioRefresh.request<dynamic>(
    //       requestOptions.path,
    //       data: requestOptions.data,
    //       queryParameters: requestOptions.queryParameters,
    //       options: options,
    //     );
    //     return handler.resolve(response);
    //   } on DioException catch (e) {
    //     if (e.response?.statusCode == 401) {
    //       await authRepository.signOut();
    //       return handler.reject(e);
    //     }
    //   }
    //   handler.next(err);
    }
  }
}