
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/courses/domain/course.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/course_repository.dart';

part 'course_controller.g.dart';

@riverpod
class CourseController extends _$CourseController {

  @override
  Future<Course?> build(String id) async {
    final courseRepository = ref.read(courseRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => courseRepository.fetchCourseById(id));
    return state.valueOrNull;
  }

}