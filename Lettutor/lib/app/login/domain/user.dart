import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/app/courses/domain/tutor_course.dart';
part 'user.g.dart';

@JsonSerializable()
class User{
  String id;
  String? level;
  String? avatar;
  String? name;
  String? country;
  String? language;
  bool? isPublicRecord;
  String? caredByStaffId;
  String? zaloUserId;
  String? studentGroupId;
  List<Course>? courses;

  User({
      required this.id,
      this.level,
      this.avatar,
      this.name,
      this.country,
      this.language,
      this.isPublicRecord,
      this.caredByStaffId,
      this.zaloUserId,
      this.studentGroupId,
      this.courses,
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}