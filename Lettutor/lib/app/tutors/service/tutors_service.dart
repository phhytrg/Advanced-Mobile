import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/login/domain/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/tutor_repository.dart';
import '../domain/tutorsList.dart';

part 'tutors_service.g.dart';

class TutorService{
  TutorService(this.ref);
  final Ref ref;

  Future<TutorsList?> getTutorsWithPagination(int perPage, int page) async {
    return await ref.read(tutorRepositoryProvider).fetchTutorsWithPagination(perPage, page);
  }

  Future<void> addTutorIntoFavoriteList(String tutorId) async{
    return await ref.read(userRepositoryProvider).addTutorIntoFavoriteList(tutorId);
  }
}

final tutorServiceProvider = Provider<TutorService>((ref) {
  return TutorService(ref);
});


@riverpod
Future<TutorsList?> tutorsListFuture(TutorsListFutureRef ref) {
  final tutorsService = ref.watch(tutorServiceProvider);
  return tutorsService.getTutorsWithPagination(9, 1);
}