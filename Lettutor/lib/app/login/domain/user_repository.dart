

import 'package:dio/dio.dart';
import 'package:lettutor/core/network/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/user.dart';

abstract class BaseUserRepository{
  Future<void> addTutorIntoFavoriteList(String tutorId);
}

class UserRepository extends BaseUserRepository{
  final String baseUrl = '/user';
  final Dio dio = NetworkService.instance.dio;

  @override
  Future<void> addTutorIntoFavoriteList(String tutorId) async {
    final response = await dio.post(
      baseUrl + "/manageFavoriteTutor",
      data: {
        "tutorId": tutorId,
      }
    );
  }
}

final userRepositoryProvider = Provider((ref) => UserRepository());