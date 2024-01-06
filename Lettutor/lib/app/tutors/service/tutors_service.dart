import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/auth/data/user_repository.dart';
import 'package:lettutor/app/schedule/data/self_schedule_repository.dart';
import 'package:lettutor/app/tutors/domain/favorite_tutor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/feedback_repository.dart';
import '../data/tutor_repository.dart';
import '../data/tutor_schedule_repository.dart';
import '../domain/feedback/feedback.dart';
import '../domain/payload/search_payload.dart';
import '../domain/response/tutor.dart';
import '../domain/response/tutor_list.dart';
import '../domain/tutor_schedule/tutor_schedule_response.dart';
import '../domain/tutorsList.dart';

// part 'tutors_service.g.dart';

class TutorService{
  TutorService(this.ref);
  final Ref ref;

  Future<TutorList?> getTutorsWithPagination(int perPage, int page) async {
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

  Future<bool> bookSchedule(String scheduleDetailId, String note) {
    return ref.read(selfScheduleRepositoryProvider).bookSchedule(scheduleDetailId, note);
  }

  Future<FeedbackList?> getTutorFeedback(String tutorId, int page, int perPage) async{
    return await ref.read(feedbackRepositoryProvider).getFeedback(tutorId, page, perPage);
  }
}

final tutorServiceProvider = Provider<TutorService>((ref) {
  return TutorService(ref);
});
