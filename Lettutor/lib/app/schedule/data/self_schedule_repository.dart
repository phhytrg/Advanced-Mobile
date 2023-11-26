

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/core/network/network_service.dart';

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
}

final selfScheduleRepositoryProvider = Provider<SelfScheduleRepository>((ref) {
  return SelfScheduleRepository();
});