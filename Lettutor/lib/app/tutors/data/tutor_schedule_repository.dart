import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/core/network/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/tutor_schedule/tutor_schedule_response.dart';

abstract class BaseScheduleRepository{
  Future<List<ScheduleOfTutor>?> getScheduleOfTutor(String tutorId, int page);
}

class ScheduleRepository extends BaseScheduleRepository{
  Dio dio = NetworkService.instance.dio;
  String baseUrl = "/schedule";
  
  @override
  Future<List<ScheduleOfTutor>?> getScheduleOfTutor(String tutorId, int page) async{
    Response response =  await dio.get(
      baseUrl,
      queryParameters: {
        "tutorId": tutorId,
        "page": page,
      },
    );

    TutorScheduleResponse tutorScheduleResponse = TutorScheduleResponse.fromJson(response.data);
    List<ScheduleOfTutor>? scheduleOfTutor = tutorScheduleResponse.scheduleOfTutor;
    return scheduleOfTutor;
  }

}

final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  return ScheduleRepository();
});