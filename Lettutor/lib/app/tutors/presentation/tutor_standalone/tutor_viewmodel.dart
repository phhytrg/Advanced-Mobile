
import 'package:lettutor/app/tutors/service/tutors_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/response/tutor.dart';
part 'tutor_viewmodel.g.dart';

@riverpod
class TutorViewmodel extends _$TutorViewmodel{

  @override
  FutureOr<Tutor?> build(String tutorId) {
    return findTutorById(tutorId);
  }

  Future<Tutor?> findTutorById(String id) async {
    final tutorService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<Tutor?>(() =>
        tutorService.findTutorialById(id));
    return state.valueOrNull;
  }

}