import 'package:lettutor/app/schedule/data/self_schedule_repository.dart';
import 'package:lettutor/app/schedule/domain/booking_list_reponse/booking_list_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_controller.g.dart';

@riverpod
class BookingController extends _$BookingController {
  var page = 1;
  final perPage = 10;

  @override
  Future<BookingList?> build() async {
    final bookingRepository = ref.read(selfScheduleRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => bookingRepository.getBookingList(page: 1, perPage: perPage, inFuture: 1));
    page++;

    return state.valueOrNull;
  }

  Future<BookingList?> getBookingList() async {
    final bookingRepository = ref.read(selfScheduleRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => bookingRepository.getBookingList(page: page, perPage: perPage, inFuture: 1));
    page++;

    return state.valueOrNull;
  }

  Future<BookingList?> getMoreBookingList() async {
    final bookingRepository = ref.read(selfScheduleRepositoryProvider);

    if (state.value == null) {
      state = await AsyncValue.guard(() =>
          bookingRepository.getBookingList(page: page, perPage: 20, inFuture: 0, orderBy: "meeting", sortBy: "desc"));
      return state.valueOrNull;
    }
    final newState = await AsyncValue.guard(() => bookingRepository.getBookingList(
          page: page,
          perPage: perPage,
          inFuture: 1,
        ));
    state = AsyncData(BookingList(count: state.value!.count, rows: [...state.value!.rows!, ...newState.value!.rows!]));
    page++;

    return state.valueOrNull;
  }
}
