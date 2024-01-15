
import 'package:lettutor/app/tutors/service/tutors_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/tutor_schedule/tutor_schedule_response.dart';

part 'tutor_schedule_controller.g.dart';

@riverpod
class TutorScheduleController extends _$TutorScheduleController{

  @override
  FutureOr<List<ScheduleOfTutor>?> build(String tutorId, int page) {
    return getTutorSchedule(tutorId, page);
  }

  Future<List<ScheduleOfTutor>?> getTutorSchedule(String tutorId, int page) async{
    final tutorService = ref.read(tutorServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<List<ScheduleOfTutor>?>(() =>
        tutorService.getTutorSchedule(tutorId, page));
    return state.valueOrNull;
  }

  Future<bool> bookSchedule(String scheduleDetailId, String tutorId, String note) async{
    final tutorService = ref.read(tutorServiceProvider);
    if(await tutorService.bookSchedule(scheduleDetailId, note)){
      state = const AsyncLoading();
      state = await AsyncValue.guard<List<ScheduleOfTutor>?>(() =>
          tutorService.getTutorSchedule(tutorId, 0));
      return true;
    }
    else{
      return false;
    }
  }
}