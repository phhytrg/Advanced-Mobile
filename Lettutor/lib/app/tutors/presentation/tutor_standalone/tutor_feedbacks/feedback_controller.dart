import 'package:flutter/cupertino.dart';
import 'package:lettutor/app/tutors/domain/feedback/feedback.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../service/tutors_service.dart';

part 'feedback_controller.g.dart';

@riverpod
class FeedbacksController extends _$FeedbacksController {
  var page = 1;

  @override
  FutureOr<FeedbackList?> build(String tutorId) async {
    final tutorService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<FeedbackList?>(() => tutorService.getTutorFeedback(tutorId, page, 12));
    page++;
    return state.valueOrNull;
  }

  Future<FeedbackList?> getMoreTutorFeedbacks(String tutorId) async {
    final tutorService = ref.read(tutorServiceProvider);
    if (state.value == null) {
      state = await AsyncValue.guard(() => tutorService.getTutorFeedback(tutorId, page, 12));
      return state.valueOrNull;
    }
    final newState = await AsyncValue.guard(() => tutorService.getTutorFeedback(tutorId, page, 12));
    state = AsyncData(FeedbackList(count: state.value!.count, rows: [...state.value!.rows, ...newState.value!.rows]));

    page++;
    return state.valueOrNull;
  }
}
