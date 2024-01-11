import 'dart:convert';

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

  Future<CourseList> filter(
      {String? query,
      required int page,
      required int pageSize,
      List<String>? level,
      List<String>? order,
      String? orderBy,
      List<String>? categoryIds}) async {
    Map<String, dynamic> queryParameters = {
      'q': query,
      'page': page,
      'size': pageSize,
      // 'level': level?.join(','),
      // 'orderBy': [orderBy].join(','),
      // 'order[]': order,
      // 'categoryId[]': categoryIds?.join(','),
    };

    Response response = await dio.get(
      baseUrl,
      queryParameters: queryParameters,
    );
    return CourseList.fromJson(response.data["data"]);
  }

  Future<List<Category>> getCategories() async {
    Response response = await dio.get(
      "/content-category",
    );
    return List<Category>.from(response.data["rows"].map((x) => Category.fromJson(x)));
  }
}

@Riverpod(keepAlive: true)
CourseRepository courseRepository(CourseRepositoryRef ref) {
  return CourseRepository(dio: ref.read(dioProvider));
}

@riverpod
Future<List<Category>> getCategories(GetCategoriesRef ref) async {
  final repo = ref.read(courseRepositoryProvider);
  return await repo.getCategories();
}
