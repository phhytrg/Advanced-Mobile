

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/schedule/domain/booking_list_reponse/booking_list_response.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'self_schedule_repository.g.dart';

class SelfScheduleRepository{
  final Dio dio;
  String baseUrl = "/booking";

  SelfScheduleRepository({required this.dio});

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

    final bookingListResponse = BookingListResponse.fromJson(response.data);
    return bookingListResponse.data;
  }

  Future<List<BookingData>> fetchNextBooking() async{
    final response = await dio.get(
      '$baseUrl/next',
    );
    Map responseData = response.data;
    final list = responseData["data"].map<BookingData>((e) => BookingData.fromJson(e)).toList();
    return list;
  }

  Future<int> fetchTotalHours() async{
    Response response = await dio.get(
      '/call/total',
    );
    Map responseData = response.data;
    return responseData["total"];
  }

  Future<String> cancelBooking(String scheduleDetailId, String cancelReason) async{
    final response = await dio.delete(
      '$baseUrl/schedule-detail',
      data: {
        "cancelInfo": {
          "cancelReasonId": 1,
          "note": cancelReason,
        },
        "scheduleDetailId": scheduleDetailId,
      },
    );
    return response.data["message"];
  }

  Future<bool> feedbackTutor(String bookingId, String feedback, int rating, String userId) async{
    final response = await dio.post(
      'user/feedbackTutor',
      data: {
        "bookingId": bookingId,
        "content": feedback,
        "rating": rating,
        "userId": userId,
      },
    );
    return response.statusCode == 200;
  }

  Future<bool> editFeedback(String feedbackId, String feedback, int rating) async{
    final response = await dio.put(
      'user/feedbackTutor',
      data: {
        "id": feedbackId,
        "content": feedback,
        "rating": rating,
      },
    );
    return response.statusCode == 200;
  }
}

@Riverpod(keepAlive: true)
SelfScheduleRepository selfScheduleRepository(SelfScheduleRepositoryRef ref){
  return SelfScheduleRepository(dio: ref.read(dioProvider));
}

@riverpod
Future<bool> feedbackTutor(FeedbackTutorRef ref, String bookingId, String userId, String feedback, int rating) async{
  final repo = ref.read(selfScheduleRepositoryProvider);
  return repo.feedbackTutor(bookingId, feedback, rating, userId);
}