

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_config.g.dart';

class AuthConfig {
  String? accessToken;
  String? refreshToken;
}

@Riverpod(keepAlive: true)
AuthConfig authConfig(AuthConfigRef ref) {
  return AuthConfig();
}