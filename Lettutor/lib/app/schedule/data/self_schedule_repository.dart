

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

  Future<BookingList?> getBookingList(
      {required int page,
      required int perPage,
      String? orderBy = "meeting",
      String? sortBy = "asc",
      required int? inFuture}) async {
    Response response;
    try{
      response = await dio.get(
        '$baseUrl/list/student',
        queryParameters: {
          "page": page,
          "perPage": perPage,
          "orderBy": orderBy,
          "sortBy": sortBy,
          "inFuture": inFuture,
        },
      );
    } on DioException catch(e){
      print(e);
      return null;
    }


    // if (response.statusCode == 200) {
      final bookingListResponse = BookingListResponse.fromJson(response.data);
      return bookingListResponse.data;
    // }
    // return null;
  }

}

final selfScheduleRepositoryProvider = Provider<SelfScheduleRepository>((ref) {
  return SelfScheduleRepository();
});