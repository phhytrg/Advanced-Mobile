import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/tutors/domain/tutors.dart';
import 'package:lettutor/core/network/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/tutorsList.dart';
import '../service/tutors_service.dart';

part 'tutor_repository.g.dart';

abstract class BaseTutorRepository{
  Future<TutorsList?> fetchTutorsWithPagination(int page, int size);
}

class TutorRepository implements BaseTutorRepository {
  final String path = "/tutor";

  @override
  Future<TutorsList?> fetchTutorsWithPagination(int perPage, int page) async{
    final response = await NetworkService.instance.dio.get(
        '/tutor/more',
      queryParameters: {
          'perPage': perPage,
          'page': page,
        }
    );
    return TutorsList.fromJson(response.data);
  }
}

final tutorRepositoryProvider = Provider<BaseTutorRepository>((ref) {
  return TutorRepository();
});

@riverpod
Future<TutorsList?> tutorsListFuture(TutorsListFutureRef ref) {
  final tutorsRepository = ref.watch(tutorRepositoryProvider);
  return tutorsRepository.fetchTutorsWithPagination(9, 1);
}