// A class to represent a user
import 'package:json_annotation/json_annotation.dart';
part 'second_info.g.dart';

@JsonSerializable()
class SecondInfo {
  SecondInfo({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.zaloUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
    this.tutorInfo,
  });

  String? id;
  String? level;
  String? email;
  String? google;
  String? facebook;
  String? apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  bool? requireNote;
  int? timezone;
  String? phoneAuth;
  bool? isPhoneAuthActivated;
  String? studySchedule;
  bool? canSendMessage;
  bool? isPublicRecord;
  String? caredByStaffId;
  String? zaloUserId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? studentGroupId;
  TutorInfo? tutorInfo; // A nested class for tutor information

  factory SecondInfo.fromJson(Map<String, dynamic> json) => _$SecondInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SecondInfoToJson(this);
}

@JsonSerializable()
class TutorInfo {
  TutorInfo({
    this.id,
    this.userId,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.resume,
    this.rating,
    this.isActivated,
    this.isNative,
    this.youtubeVideoId,
    this.createdAt,
    this.updatedAt,
  });

// A list of fields with their types and nullability
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  String? resume;
  double? rating;
  bool? isActivated;
  bool? isNative;
  String? youtubeVideoId;
  String? createdAt;
  String? updatedAt;

  factory TutorInfo.fromJson(Map<String, dynamic> json) => _$TutorInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TutorInfoToJson(this);
}
