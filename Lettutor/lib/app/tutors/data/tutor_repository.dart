import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/login/data/user_repository.dart';
import 'package:lettutor/app/tutors/domain/payload/search_payload.dart';
import 'package:lettutor/app/tutors/domain/tutors.dart';
import 'package:lettutor/core/network/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/favorite_tutor.dart';
import '../domain/response/tutor.dart';
import '../domain/response/tutor_list.dart';
import '../domain/tutorsList.dart';

abstract class BaseTutorRepository {
  Future<TutorList?> fetchTutorsWithPagination(int perPage, String page);

  Future<TutorList?> searchTutorsByFilters(SearchPayload filters);

  Future<Tutor?> findTutorialById(String id);
}

class TutorRepository implements BaseTutorRepository {
  Dio dio = NetworkService.instance.dio;
  final String path = "/tutor";

  @override
  Future<TutorList?> fetchTutorsWithPagination(int perPage, String page) async {
    final response = await dio.post('/tutor/search', data: SearchPayload(
        page: page,
        perPage: perPage,
        filters: Filters(
          specialties: [],
        ),
        search: ''
    ).toJson());

    TutorList tutorList = TutorList.fromJson(response.data);
    return tutorList;
  }

  @override
  Future<TutorList?> searchTutorsByFilters(SearchPayload searchPayload) async {
    final response = await dio.post('/tutor/search', data: searchPayload.toJson());
    TutorList tutorList = TutorList.fromJson(response.data);
    return tutorList;
  }

  @override
  Future<Tutor?> findTutorialById(String id) async{
    final response = await dio.get('/tutor/$id');
    Tutor tutor =  Tutor.fromJson(response.data);
    return tutor;
  }
}

final tutorRepositoryProvider = Provider<BaseTutorRepository>((ref) {
  return TutorRepository();
});
