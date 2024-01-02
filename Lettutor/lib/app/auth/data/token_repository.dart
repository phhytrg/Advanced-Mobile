import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lettutor/app/auth/data/auth_repository.dart';
import 'package:lettutor/app/auth/data/local_auth_repository.dart';
import 'package:lettutor/core/config/auth_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_repository.g.dart';

class TokenRepository {
  final AuthConfig authConfig;
  final LocalAuthRepository localAuthRepository;

  TokenRepository({required this.authConfig, required this.localAuthRepository});

  Future<String?> get loadAccessToken async {
    String? accessToken = authConfig.accessToken;
    if (accessToken != null && !tokenHasExpired(accessToken)) {
      return accessToken;
    }

    accessToken = await localAuthRepository.getAccessToken();

    if (accessToken != null && !tokenHasExpired(accessToken)) {
      authConfig.accessToken = accessToken;
      return accessToken;
    }

    return null;
  }

  Future<String?> get loadRefreshToken async {
    String? refreshToken = authConfig.refreshToken;
    if (refreshToken != null && !tokenHasExpired(refreshToken)) {
      return refreshToken;
    }

    refreshToken = await localAuthRepository.getRefreshToken();

    if (refreshToken != null && !tokenHasExpired(refreshToken)) {
      authConfig.refreshToken = refreshToken;
      return refreshToken;
    }

    return null;
  }

  Future<void> saveAccessToken(String? accessToken) async {
    authConfig.accessToken = accessToken;
    // await localAuthRepository.setAccessToken(accessToken);
  }

  Future<void> saveRefreshToken(String? refreshToken) async {
    authConfig.refreshToken = refreshToken;
    // await localAuthRepository.setRefreshToken(refreshToken);
  }

  bool tokenHasExpired(String token) {
    if (token.isEmpty) {
      return true;
    } else {
      return JwtDecoder.isExpired(token);
    }
  }
}

@Riverpod(keepAlive: true)
TokenRepository tokenRepository(TokenRepositoryRef ref) {
  return TokenRepository(
      authConfig: ref.read(authConfigProvider),
      localAuthRepository: ref.read(localAuthRepositoryProvider));
}

@Riverpod(keepAlive: true)
Future<String?> accessToken(AccessTokenRef ref) async {
  return await ref.read(tokenRepositoryProvider).loadAccessToken;
}