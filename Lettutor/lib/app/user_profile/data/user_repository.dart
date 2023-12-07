import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/user_profile/domain/user.dart';
import 'package:lettutor/core/network/network_service.dart';

class UserRepository {
  final Dio dio = NetworkService.instance.dio;
  final String baseUrl = "/user";

  Future<User> getUserProfile() async {
    Response response = await dio.get(
      '$baseUrl/info',
    );

    Map data = response.data;

    return User.fromJson(data["user"]);
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});