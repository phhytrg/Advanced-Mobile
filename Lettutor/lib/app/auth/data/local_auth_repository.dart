import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lettutor/core/data/local/local_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_repository.g.dart';

class LocalAuthRepository{
  final FlutterSecureStorage secureStorage;

  LocalAuthRepository(this.secureStorage);

  Future<String?> getAccessToken () async {
    return await secureStorage.read(key: 'accessToken') ?? '';
  }

  Future<void> setAccessToken(String? accessToken) async {
    if(accessToken == null){
      return await secureStorage.delete(key: 'accessToken');
    }
    await secureStorage.write(key: 'accessToken', value: accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await secureStorage.read(key: 'refreshToken') ?? '';
  }

  Future<void> setRefreshToken(String? refreshToken) async {
    if(refreshToken == null){
      return await secureStorage.delete(key: 'refreshToken');
    }
    return await secureStorage.write(key: 'refreshToken', value: refreshToken);
  }
}

@Riverpod(keepAlive: true)
LocalAuthRepository localAuthRepository(LocalAuthRepositoryRef ref){
  return LocalAuthRepository(ref.read(secureStorageProvider));
}