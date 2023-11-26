

import 'package:flutter/cupertino.dart';
import 'package:lettutor/app/tutors/domain/feedback/feedback.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../service/tutors_service.dart';

part 'feedback_controller.g.dart';

@riverpod
class FeedbacksController extends _$FeedbacksController{
  @override
  FutureOr<FeedbackList?> build(String tutorId, int page, int perPage) async{
    final tutorService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<FeedbackList?>(() =>
        tutorService.getTutorFeedback(tutorId, page, perPage));
    return state.valueOrNull;
  }

  Future<FeedbackList?> getTutorFeedbacks(String tutorId, int page, int perPage) async{
    final tutorService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<FeedbackList?>(() =>
        tutorService.getTutorFeedback(tutorId, page, perPage));
    return state.valueOrNull;
  }

  Future<FeedbackList?> getMoreTutorFeedbacks(String tutorId, int page, int perPage) async{
    final tutorService = ref.read(tutorServiceProvider);
    AsyncValue<FeedbackList?> previousState = state;

    state = const AsyncLoading();
    final newResponse = await AsyncValue.guard<FeedbackList?>(() =>
        tutorService.getTutorFeedback(tutorId, page, perPage));
    previousState.valueOrNull?.rows.addAll(newResponse.valueOrNull?.rows ?? []);

    state = previousState;
    return state.valueOrNull;
  }
}