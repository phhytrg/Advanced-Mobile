

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../schedule/data/self_schedule_repository.dart';

part 'total_hours_controller.g.dart';

@riverpod
class TotalHoursController extends _$TotalHoursController {
  @override
  Future<int> build() async {
    state = const AsyncLoading();
    final selfSchedulerRepository = ref.read(selfScheduleRepositoryProvider);
    state = await AsyncValue.guard(() => selfSchedulerRepository.fetchTotalHours());
    return state.valueOrNull ?? 0;
  }
}