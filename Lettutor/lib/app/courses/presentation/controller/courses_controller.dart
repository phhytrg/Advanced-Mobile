import 'package:lettutor/app/courses/domain/course.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/course_repository.dart';

part 'courses_controller.g.dart';

@riverpod
class CourseListController extends _$CourseListController {
  @override
  Future<CourseList> build() async {
    return fetchCourse(1, 100);
  }

  Future<CourseList> fetchCourse(int page, int perPage) async {
    final courseRepository = ref.read(courseRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => courseRepository.fetchCourse(page, perPage));
    return state.valueOrNull ?? CourseList(count: 0, rows: []);
  }

  Future<CourseList> filter(
      {String? query, List<String>? level, List<String>? order, String? orderBy, List<String>? categoryIds}) async {
    final courseRepository = ref.read(courseRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => courseRepository.filter(
          query: query,
          page: 1,
          pageSize: 100,
          level: level,
          order: order,
          orderBy: orderBy,
          categoryIds: categoryIds,
        ));
    return state.valueOrNull ?? CourseList(count: 0, rows: []);
  }
}
