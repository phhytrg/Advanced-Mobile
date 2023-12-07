


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/schedule/domain/booking_list_reponse/booking_list_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/self_schedule_repository.dart';

part 'booking_history_controller.g.dart';

@riverpod
class BookingHistoryController extends _$BookingHistoryController {
  var page = 1;
  @override
  Future<BookingList?> build() async {
    final bookingRepository = ref.read(selfScheduleRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => bookingRepository.getBookingList(page: page, perPage: 20, inFuture: 0, orderBy: "meeting", sortBy: "desc"));
    page++;
    return state.valueOrNull;
  }

  Future<BookingList?> loadMore() async {
    final bookingRepository = ref.read(selfScheduleRepositoryProvider);
    if(state.value == null){
      state = await AsyncValue.guard(() =>
          bookingRepository.getBookingList(
              page: page,
              perPage: 20,
              inFuture: 0,
              orderBy: "meeting",
              sortBy: "desc"));
      return state.valueOrNull;
    }
    final newState = await AsyncValue.guard(() =>
        bookingRepository.getBookingList(
            page: page,
            perPage: 20,
            inFuture: 0,
            orderBy: "meeting",
            sortBy: "desc"));
    state = AsyncData(BookingList(count: state.value!.count, rows: [...state.value!.rows!, ...newState.value!.rows!]));

    page++;
    return state.valueOrNull;
  }
}