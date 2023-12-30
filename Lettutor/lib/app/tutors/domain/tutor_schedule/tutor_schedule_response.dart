import 'package:json_annotation/json_annotation.dart';

import '../response/tutor.dart';

part 'tutor_schedule_response.g.dart';

@JsonSerializable()
class TutorScheduleResponse {
  String? message;
  List<ScheduleOfTutor>? scheduleOfTutor;

  TutorScheduleResponse({this.message, this.scheduleOfTutor});

  factory TutorScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$TutorScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TutorScheduleResponseToJson(this);
}

@JsonSerializable()
class ScheduleOfTutor {
  String? id;
  String? tutorId;
  String? startTime;
  int? startTimestamp;
  int? endTimestamp;
  String? createdAt;
  bool? isBooked;
  List<ScheduleDetail>? scheduleDetails;

  ScheduleOfTutor(
      {this.id,
      this.tutorId,
      this.startTime,
      this.startTimestamp,
      this.endTimestamp,
      this.createdAt,
      this.isBooked,
      this.scheduleDetails});

  factory ScheduleOfTutor.fromJson(Map<String, dynamic> json) =>
      _$ScheduleOfTutorFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleOfTutorToJson(this);
}

@JsonSerializable()
class ScheduleDetail {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;

  ScheduleInfo? scheduleInfo;

  ScheduleDetail(
      {this.startPeriodTimestamp,
      this.endPeriodTimestamp,
      this.id,
      this.scheduleId,
      this.startPeriod,
      this.endPeriod,
      this.createdAt,
      this.updatedAt,
      this.bookingInfo,
      this.isBooked,
      this.scheduleInfo});

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDetailToJson(this);
}

@JsonSerializable()
class BookingInfo {
  int? createdAtTimestamp;
  int? updatedAtTimestamp;
  String? id;
  bool? isDeleted;
  String? createdAt;
  String? scheduleDetailId;
  String? updatedAt;
  int? cancelReasonId;
  String? userId;

  BookingInfo(
      {this.createdAtTimestamp,
      this.updatedAtTimestamp,
      this.id,
      this.isDeleted,
      this.createdAt,
      this.scheduleDetailId,
      this.updatedAt,
      this.cancelReasonId,
      this.userId});

  factory BookingInfo.fromJson(Map<String, dynamic> json) =>
      _$BookingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookingInfoToJson(this);
}

@JsonSerializable()
class ScheduleInfo {
  String? id;
  String? tutorId;
  String? startTime;
  int? startTimestamp;
  int? endTimestamp;
  String? createdAt;
  Tutor? tutorInfo;

  ScheduleInfo(
      {this.id,
      this.tutorId,
      this.startTime,
      this.startTimestamp,
      this.endTimestamp,
      this.createdAt,
      this.tutorInfo});

  factory ScheduleInfo.fromJson(Map<String, dynamic> json) =>
      _$ScheduleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleInfoToJson(this);
}
