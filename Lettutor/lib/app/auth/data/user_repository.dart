

import 'package:dio/dio.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

abstract class BaseUserRepository{
  Future<void> updateTutorInFavoriteList(String tutorId);
}

class UserRepository extends BaseUserRepository{
  final String baseUrl = '/user';
  final Dio dio;

  UserRepository({required this.dio});

  @override
  Future<void> updateTutorInFavoriteList(String tutorId) async {
    final response = await dio.post(
      "$baseUrl/manageFavoriteTutor",
      data: {
        "tutorId": tutorId,
      }
    );
  }
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref){
  return UserRepository(dio: ref.read(dioProvider));
}