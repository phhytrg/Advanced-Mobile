import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/payload/search_payload.dart';
import '../../../domain/response/tutor_list.dart';
import '../../../service/tutors_service.dart';

part 'tutors_controller.g.dart';

@riverpod
class TutorsController extends _$TutorsController {
  var page = 1;
  var perPage = 9;

  @override
  FutureOr<TutorList?> build() async {
    final tutorsService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<TutorList?>(() => tutorsService.getTutorsWithPagination(9, 1));
    return state.valueOrNull;
  }

  Future<TutorList?> getTutorsWithPagination(int perPage, int page) async {
    this.page = 1;
    final tutorsService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<TutorList?>(() => tutorsService.getTutorsWithPagination(perPage, page));
    return state.valueOrNull;
  }

  Future<TutorList?> searchTutorsByFilters(SearchPayload filters) async {
    final tutorsService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<TutorList?>(() => tutorsService.searchTutorsByFilters(filters));
    if(filters.page != null) {
      page = filters.page!;
    }
    return state.valueOrNull;
  }

  Future<void> getMoreTutors(SearchPayload filters) async{
    page++;
    filters.page = page;
    filters.perPage = perPage;
    final tutorService = ref.read(tutorServiceProvider);
    if (state.value == null) {
      state = await AsyncValue.guard(() => tutorService.searchTutorsByFilters(filters));
    }
    final newState = await AsyncValue.guard(() => tutorService.searchTutorsByFilters(filters));
    state = AsyncData(TutorList(count: state.value!.count, rows: [...?state.value!.rows, ...?newState.value!.rows]));
  }
}
