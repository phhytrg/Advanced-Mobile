
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/courses/domain/course.dart';
import 'package:lettutor/core/network/network_service.dart';

class CourseRepository {

  final Dio dio = NetworkService.instance.dio;
  final String baseUrl = "/course";

  Future<CourseList> fetchCourse(int page, int perPage) async {
    Response response = await dio.get(
      baseUrl,
      queryParameters: {
        "page": page,
        "size": perPage,
      },
    );

    Map<String, dynamic> jsonDecoded = response.data;

    return CourseList.fromJson(jsonDecoded["data"]);
  }

  Future<Course> fetchCourseById(String id) async {
    Response response = await dio.get(
      "$baseUrl/$id",
    );

    Map<String, dynamic> jsonDecoded = response.data;

    return Course.fromJson(jsonDecoded["data"]);
  }

}

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  return CourseRepository();
});