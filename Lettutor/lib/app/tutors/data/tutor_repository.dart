import 'package:dio/dio.dart';
import 'package:lettutor/app/tutors/domain/payload/search_payload.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lettutor/app/tutors/domain/response/tutor.dart';
import 'package:lettutor/app/tutors/domain/response/tutor_list.dart';

part 'tutor_repository.g.dart';

abstract class BaseTutorRepository {
  Future<TutorList?> fetchTutorsWithPagination(int perPage, int page);

  Future<TutorList?> searchTutorsByFilters(SearchPayload filters);

  Future<Tutor?> findTutorialById(String id);

  Future<bool> reportTutor(String id, String reason);
}

class TutorRepository implements BaseTutorRepository {
  final Dio dio;
  final String path = "/tutor";

  TutorRepository({required this.dio});

  @override
  Future<TutorList?> fetchTutorsWithPagination(int perPage, int page) async {
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

  @override
  Future<bool> reportTutor(String id, String reason) async {
    final response = await dio.post('/report', data: {
      'tutorId': id,
      'content': reason
    });
    return response.statusCode == 200;
  }
}

@Riverpod(keepAlive: true)
TutorRepository tutorRepository(TutorRepositoryRef ref) {
  return TutorRepository(dio: ref.read(dioProvider));
}

@riverpod
Future<bool> reportTutor(ReportTutorRef ref, String id, String reason){
  return ref.read(tutorRepositoryProvider).reportTutor(id, reason);
}
