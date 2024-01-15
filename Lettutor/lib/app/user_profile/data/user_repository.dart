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

  Future<User> updateUserProfile(Map<String, dynamic> user) async {
    Response response = await dio.put(
      '$baseUrl/info',
      data: user,
    );

    Map data = response.data;

    return User.fromJson(data["user"]);
  }

  Future<bool> uploadAvatar(MultipartFile avatar) async {
    Response response = await dio.post(
      '$baseUrl/uploadAvatar',
      data: FormData.fromMap({
        "avatar": avatar,
      }),
    );

    return response.statusCode == 200;
  }
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(dio: ref.read(dioProvider));
}
