

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/core/network/network_service.dart';

import '../domain/booking_list_reponse/booking_list_response.dart';

class SelfScheduleRepository{
  Dio dio = NetworkService.instance.dio;
  String baseUrl = "/booking";

  Future<bool> bookSchedule(String scheduleDetailId, String note) async{
    Response response;
    try {
      response = await dio.post(
        baseUrl,
        data: {
          "scheduleDetailIds": [scheduleDetailId],
          "note": note,
        },
      );
    } on DioException catch (e) {
      print(e);
      return false;
    }
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<BookingList?> getBookingList({required int page, required int perPage, String? orderBy = "meeting", String? sortBy = "asc"}){

  }

}

final selfScheduleRepositoryProvider = Provider<SelfScheduleRepository>((ref) {
  return SelfScheduleRepository();
});