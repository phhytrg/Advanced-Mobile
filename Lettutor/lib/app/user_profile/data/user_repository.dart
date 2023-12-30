import 'package:dio/dio.dart';
import 'package:lettutor/app/user_profile/domain/user.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository {
  final Dio dio;
  final String baseUrl = "/user";

  UserRepository({required this.dio});

  Future<User> getUserProfile() async {
    Response response = await dio.get(
      '$baseUrl/info',
    );

    Map data = response.data;

    return User.fromJson(data["user"]);
  }
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(dio: ref.read(dioProvider));
}