
import 'package:json_annotation/json_annotation.dart';
part 'first_info.g.dart';

@JsonSerializable()
class FirstInfo{
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
  String? requireNote;
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


  FirstInfo({
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
      this.studentGroupId});

  factory FirstInfo.fromJson(Map<String, dynamic> json) => _$FirstInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FirstInfoToJson(this);
}