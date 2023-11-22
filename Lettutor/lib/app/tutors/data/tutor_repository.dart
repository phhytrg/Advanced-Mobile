import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/login/data/user_repository.dart';
import 'package:lettutor/app/tutors/domain/payload/search_payload.dart';
import 'package:lettutor/app/tutors/domain/tutors.dart';
import 'package:lettutor/core/network/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/favorite_tutor.dart';
import '../domain/response/tutor_list.dart';
import '../domain/tutorsList.dart';

abstract class BaseTutorRepository {
  Future<TutorList?> fetchTutorsWithPagination(int page, int size);

  Future<List<FavoriteTutor>?> getFavoriteTutorList();

  Future<TutorList?> searchTutorsByFilters(SearchPayload filters);
}

class TutorRepository implements BaseTutorRepository {
  Dio dio = NetworkService.instance.dio;
  final String path = "/tutor";

  @override
  Future<TutorList?> fetchTutorsWithPagination(int perPage, int page) async {
    final response = await dio.post(
        '/tutor/search',
        data: {
          'perPage': perPage,
          'page': page,
        }
    );

    TutorList tutorList = TutorList.fromJson(response.data);
    return tutorList;
  }

  @override
  Future<List<FavoriteTutor>?> getFavoriteTutorList() async {
    // final response = await dio.get(
    //     '/tutor/more',
    //     queryParameters: {
    //       'perPage': 1,
    //       'page': 1,
    //     }
    // );
    // print(response.data);
    // final tutorsList = TutorList.fromJson(response.data);
    // return tutorsList.favoriteTutor;
    // return List<FavoriteTutor>.from(response.data?.map((x) => FavoriteTutor.fromJson(x)));
  }

  @override
  Future<TutorList?> searchTutorsByFilters(SearchPayload searchPayload) async {

    Map<String, dynamic> body = {
      "filters": {
        "specialties": ["english-for-kids"],
      },
      "page": "1", "perPage": 9};
    final response = await dio.post(
        '/tutor/search',
        data: searchPayload.toJson()
    );
    TutorList tutorList = TutorList.fromJson(response.data);
    print(tutorList);
    return tutorList;
  }

    }

    final tutorRepositoryProvider = Provider<BaseTutorRepository>((ref) {
    return TutorRepository();
    });