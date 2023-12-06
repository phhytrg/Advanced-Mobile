

import 'package:lettutor/app/schedule/data/self_schedule_repository.dart';
import 'package:lettutor/app/schedule/domain/booking_list_reponse/booking_list_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_controller.g.dart';

@riverpod
class BookingController extends _$BookingController{

  @override
  Future<BookingList?> build() async{
    final bookingRepository = ref.read(selfScheduleRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => bookingRepository.getBookingList(page: 1, perPage: 10, inFuture: 1));

    return state.valueOrNull;
  }

  Future<BookingList?> getBookingList() async{
    final bookingRepository = ref.read(selfScheduleRepositoryProvider);

    state = AsyncLoading();
    state = await AsyncValue.guard(() => bookingRepository.getBookingList(page: 1, perPage: 10, inFuture: 1));

    return state.valueOrNull;
  }

}