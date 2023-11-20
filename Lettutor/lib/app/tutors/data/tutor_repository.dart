import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/login/data/user_repository.dart';
import 'package:lettutor/app/tutors/domain/tutors.dart';
import 'package:lettutor/core/network/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/favorite_tutor.dart';
import '../domain/tutorsList.dart';

abstract class BaseTutorRepository{
  Future<TutorsList?> fetchTutorsWithPagination(int page, int size);
  Future<List<FavoriteTutor>?> getFavoriteTutorList();
}

class TutorRepository implements BaseTutorRepository {
  Dio dio = NetworkService.instance.dio;
  final String path = "/tutor";

  @override
  Future<TutorsList?> fetchTutorsWithPagination(int perPage, int page) async{
    final response = await dio.get(
        '/tutor/more',
      queryParameters: {
          'perPage': perPage,
          'page': page,
        }
    );
    return TutorsList.fromJson(response.data);
  }

  @override
  Future<List<FavoriteTutor>?> getFavoriteTutorList() async {
    final response = await dio.get(
      '/tutor/more',
      queryParameters: {
        'perPage': 1,
        'page': 1,
      }
    );
    final tutorsList = TutorsList.fromJson(response.data);
    return tutorsList.favoriteTutor;
    // return List<FavoriteTutor>.from(response.data?.map((x) => FavoriteTutor.fromJson(x)));
  }
}

final tutorRepositoryProvider = Provider<BaseTutorRepository>((ref) {
  return TutorRepository();
});