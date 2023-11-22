
import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/payload/search_payload.dart';
import '../domain/response/tutor_list.dart';
import '../service/tutors_service.dart';

part 'tutors_viewmodel.g.dart';

@riverpod
class TutorsViewmodel extends _$TutorsViewmodel{

  @override
  FutureOr<TutorList?> build() {
    return getTutorsWithPagination(9, 1);
  }

  Future<TutorList?> getTutorsWithPagination(int perPage, int page) async {
    final tutorsService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<TutorList?>(() =>
        tutorsService.getTutorsWithPagination(perPage, page));
    print(state.valueOrNull);
    return state.valueOrNull;
  }

    Future<TutorList?> searchTutorsByFilters(SearchPayload filters) async {
      final tutorsService = ref.read(tutorServiceProvider);
      state = const AsyncLoading();
      state = await AsyncValue.guard<TutorList?>(() =>
          tutorsService.searchTutorsByFilters(filters));
      return state.valueOrNull;
    }
}