import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/login/data/user_repository.dart';
import 'package:lettutor/app/schedule/data/schedule_repository.dart';
import 'package:lettutor/app/schedule/domain/tutor_schedule/tutor_schedule_response.dart';
import 'package:lettutor/app/tutors/domain/favorite_tutor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/tutor_repository.dart';
import '../domain/payload/search_payload.dart';
import '../domain/response/tutor.dart';
import '../domain/response/tutor_list.dart';
import '../domain/tutorsList.dart';

// part 'tutors_service.g.dart';

class TutorService{
  TutorService(this.ref);
  final Ref ref;

  Future<TutorList?> getTutorsWithPagination(int perPage, String page) async {
    return await ref.read(tutorRepositoryProvider).fetchTutorsWithPagination(perPage, page);
  }

  Future<void> updateTutorInFavoriteList(String tutorId) async{
    await ref.read(userRepositoryProvider).updateTutorInFavoriteList(tutorId);
    // _setFavoriteTutorList();
  }

  Future<TutorList?> searchTutorsByFilters(SearchPayload searchPayload) async {
    return await ref.read(tutorRepositoryProvider).searchTutorsByFilters(searchPayload);
  }

  Future<Tutor?> findTutorialById(String id) async {
    final response =  await ref.read(tutorRepositoryProvider).findTutorialById(id);
    return response;
  }

  Future<List<ScheduleOfTutor>?> getTutorSchedule(String tutorId, int page) async{
    final response = await ref.read(scheduleRepositoryProvider).getScheduleOfTutor(tutorId, page);
    return response;
  }
}

final tutorServiceProvider = Provider<TutorService>((ref) {
  return TutorService(ref);
});


// @Riverpod(keepAlive: true)
// Future<TutorsList?> tutorsListFuture(TutorsListFutureRef ref) {
//   final tutorsService = ref.watch(tutorServiceProvider);
//   return tutorsService.getTutorsWithPagination(9, 1);
// }

// final tutorsListFutureProvider = FutureProvider.autoDispose<TutorsList?>((ref) {
//   final tutorsService = ref.watch(tutorServiceProvider);
//   return tutorsService.getTutorsWithPagination(9, 1);
// });
// @Riverpod(keepAlive: true)
// List<FavoriteTutor> favoriteTutorList(FavoriteTutorListRef ref){
//   final tutorsList = ref.watch(tutorsListFutureProvider).value ?? TutorsList();
//   return tutorsList.favoriteTutor ?? [];
// }

// final favoriteTutorListProvider = StateProvider.autoDispose<List<FavoriteTutor>>((ref) {
//   final tutorsList = ref.watch(tutorsListFutureProvider).value ?? TutorsList();
//   return tutorsList.favoriteTutor ?? [];
// });