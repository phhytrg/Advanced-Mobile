import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lettutor/core/data/local/local_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_repository.g.dart';

class LocalAuthRepository{
  final FlutterSecureStorage secureStorage;

  LocalAuthRepository(this.secureStorage);

  Future<String?> getAccessToken () async {
    final localToken = await secureStorage.read(key: 'token');
    if(localToken == null) return null;
    final accessToken = jsonDecode(localToken)['access']['token'];
    return accessToken;
  }

  Future<String?> getRefreshToken() async {
    final localToken = await secureStorage.read(key: 'token');
    if(localToken == null) return null;
    final refreshToken = jsonDecode(localToken)['refresh']['token'];
    return refreshToken;
  }

  // Future<void> saveUserId(userId) async {
  //   await secureStorage.write(key: 'userId', value: userId);
  // }
  //
  // Future<String?> getUserId() async {
  //   return await secureStorage.read(key: 'userId');
  // }
}

@Riverpod(keepAlive: true)
LocalAuthRepository localAuthRepository(LocalAuthRepositoryRef ref){
  return LocalAuthRepository(ref.read(secureStorageProvider));
}