
import 'package:lettutor/app/schedule/data/self_schedule_repository.dart';
import 'package:lettutor/app/schedule/domain/booking_list_reponse/booking_list_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upcoming_lesson_controller.g.dart';

@riverpod
class UpcomingLessonController extends _$UpcomingLessonController {

  @override
  Future<List<BookingData>?> build() async {
      state = const AsyncLoading();
      final selfSchedulerRepository = ref.read(selfScheduleRepositoryProvider);
      state = await AsyncValue.guard(() => selfSchedulerRepository.fetchNextBooking());
      return state.value;
  }
}