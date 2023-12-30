
import 'package:dio/dio.dart';
import 'package:lettutor/app/courses/domain/course.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_repository.g.dart';

class CourseRepository {

  final Dio dio;
  final String baseUrl = "/course";

  CourseRepository({required this.dio});

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

@Riverpod(keepAlive: true)
CourseRepository courseRepository(CourseRepositoryRef ref) {
  return CourseRepository(dio: ref.read(dioProvider));
}