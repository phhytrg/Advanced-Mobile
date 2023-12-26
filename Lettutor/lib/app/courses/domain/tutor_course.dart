import 'package:json_annotation/json_annotation.dart';
part 'tutor_course.g.dart';

@JsonSerializable()
class Course{
  String? id;
  String? name;
  @JsonKey(name: 'TutorCourse')
  TutorCourse? tutorCourse;

  Course({this.id, this.name, this.tutorCourse});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class TutorCourse  {
  @JsonKey(name: 'UserId')
  String? userId;
  @JsonKey(name: 'CourseId')
  String? courseId;
  String? createdAt;
  String? updatedAt;

  TutorCourse({this.userId, this.courseId, this.createdAt, this.updatedAt});

  factory TutorCourse.fromJson(Map<String, dynamic> json) => _$TutorCourseFromJson(json);
  Map<String, dynamic> toJson() => _$TutorCourseToJson(this);
}