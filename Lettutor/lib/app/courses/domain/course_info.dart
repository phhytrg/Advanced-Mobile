import 'course.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_info.g.dart';

@JsonSerializable()
class CourseInfo {
  String description;
  String id;
  String imageUrl;
  String level;
  String name;
  String purpose;
  String reason;
  List<Topic> topics;

  CourseInfo({
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.level,
    required this.name,
    required this.purpose,
    required this.reason,
    required this.topics,
  });

  factory CourseInfo.fromJson(Map<String, dynamic> json) => _$CourseInfoFromJson(json);
  Map<String, dynamic> toJson() => _$CourseInfoToJson(this);
}