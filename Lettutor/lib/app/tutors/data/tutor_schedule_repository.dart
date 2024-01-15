import 'package:dio/dio.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lettutor/app/tutors/domain/tutor_schedule/tutor_schedule_response.dart';

part 'tutor_schedule_repository.g.dart';

abstract class BaseScheduleRepository{
  Future<List<ScheduleOfTutor>?> getScheduleOfTutor(String tutorId, int page);
}

class ScheduleRepository extends BaseScheduleRepository{
  final Dio dio;
  String baseUrl = "/schedule";

  ScheduleRepository({required this.dio});
  
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

@Riverpod(keepAlive: true)
ScheduleRepository scheduleRepository(ScheduleRepositoryRef ref){
  return ScheduleRepository(dio: ref.read(dioProvider));
}