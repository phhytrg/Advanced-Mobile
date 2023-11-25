// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorCourse _$TutorCourseFromJson(Map<String, dynamic> json) => TutorCourse(
      userId: json['UserId'] as String?,
      courseId: json['CourseId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$TutorCourseToJson(TutorCourse instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'CourseId': instance.courseId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
