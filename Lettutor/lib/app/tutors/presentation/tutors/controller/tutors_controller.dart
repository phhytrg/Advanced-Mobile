
import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/payload/search_payload.dart';
import '../../../domain/response/tutor_list.dart';
import '../../../service/tutors_service.dart';

part 'tutors_controller.g.dart';

@riverpod
class TutorsController extends _$TutorsController{

  @override
  FutureOr<TutorList?> build() async{
    // return await searchTutorsByFilters(SearchPayload(filters: new Filters(), page: "1", perPage: 9));
    return await getTutorsWithPagination(9, "1");
  }

  Future<TutorList?> getTutorsWithPagination(int perPage, String page) async {
    final tutorsService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<TutorList?>(() =>
        tutorsService.getTutorsWithPagination(perPage, page));
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