
import 'package:json_annotation/json_annotation.dart';
part 'tutor_schedule_response.g.dart';

@JsonSerializable()
class TutorScheduleResponse{
  String? message;
  List<ScheduleOfTutor>? scheduleOfTutor;

  TutorScheduleResponse({this.message, this.scheduleOfTutor});

  factory TutorScheduleResponse.fromJson(Map<String, dynamic> json) => _$TutorScheduleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TutorScheduleResponseToJson(this);
}

@JsonSerializable()
class ScheduleOfTutor{
  String? id;
  String? tutorId;
  String? startTime;
  int? startTimestamp;
  int? endTimestamp;
  String? createAt;
  bool? isBooked;
  List<ScheduleDetail>? scheduleDetails;

  ScheduleOfTutor({this.id, this.tutorId, this.startTime, this.startTimestamp, this.endTimestamp, this.createAt, this.isBooked, this.scheduleDetails});

  factory ScheduleOfTutor.fromJson(Map<String, dynamic> json) => _$ScheduleOfTutorFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleOfTutorToJson(this);
}

@JsonSerializable()
class ScheduleDetail{
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createAt;
  String? updateAt;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;

  ScheduleDetail({this.startPeriodTimestamp, this.endPeriodTimestamp, this.id, this.scheduleId, this.startPeriod, this.endPeriod, this.createAt, this.updateAt, this.bookingInfo, this.isBooked});

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) => _$ScheduleDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDetailToJson(this);
}

@JsonSerializable()
class BookingInfo{
  int? createdAtTimestamp;
  int? updatedAtTimestamp;
  String? id;
  bool? isDeleted;
  String? createAt;
  String? scheduleDetailId;
  String? updatedAt;
  String? cancelReasonId;
  String? userId;

  BookingInfo({this.createdAtTimestamp, this.updatedAtTimestamp, this.id, this.isDeleted, this.createAt, this.scheduleDetailId, this.updatedAt, this.cancelReasonId, this.userId});

  factory BookingInfo.fromJson(Map<String, dynamic> json) => _$BookingInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BookingInfoToJson(this);
}