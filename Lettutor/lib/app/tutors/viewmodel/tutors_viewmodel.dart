
import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/tutors.dart';
import '../domain/tutorsList.dart';
import '../service/tutors_service.dart';

part 'tutors_viewmodel.g.dart';

@riverpod
class TutorsViewmodel extends _$TutorsViewmodel{

  @override
  FutureOr<TutorsList?> build() {
    return null;
  }

  Future<TutorsList?> getTutorsWithPagination(int perPage, int page) async {
    final tutorsService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<TutorsList?>(() => tutorsService.getTutorsWithPagination(perPage, page));
    print(state);
    return state.valueOrNull;
  }
}