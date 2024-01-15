// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as String?,
      name: json['name'] as String?,
      tutorCourse: json['TutorCourse'] == null
          ? null
          : TutorCourse.fromJson(json['TutorCourse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'TutorCourse': instance.tutorCourse,
    };

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
