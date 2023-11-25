import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/app/courses/domain/tutor_course.dart';
part 'course.g.dart';

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