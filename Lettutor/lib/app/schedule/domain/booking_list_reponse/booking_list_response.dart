

import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/app/tutors/domain/tutor_schedule/tutor_schedule_response.dart';

part 'booking_list_response.g.dart';

@JsonSerializable()
class BookingListResponse{
  String? message;
  List<BookingList>? bookingList;

  BookingListResponse({this.message, this.bookingList});

  factory BookingListResponse.fromJson(Map<String, dynamic> json) => _$BookingListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookingListResponseToJson(this);
}

@JsonSerializable()
class BookingList {
  int count;
  List<BookingData>? rows;

  BookingList({required this.count, required this.rows});

  factory BookingList.fromJson(Map<String, dynamic> json) => _$BookingListFromJson(json);
  Map<String, dynamic> toJson() => _$BookingListToJson(this);
}

@JsonSerializable()
class BookingData {
  String? calendarId;
  String? cancelNote;
  String? cancelReasonId;
  String? classReviewId;
  int? convertedLesson;
  String? createdAt;
  int? createdAtTimestamp;
  List<String>? feedbacks;
  String? googleMeetLink;
  String? id;
  bool? isDeleted;
  bool? isTrial;
  String? lessonPlanId;
  String? recordUrl;
  String? scheduleDetailId;
  ScheduleDetail? scheduleDetailInfo;
  double? scoreByTutor;
  bool? showRecordByUrl;
  List<String>? studentMaterials;
  String? studentMeetingLink;
  String? tutorReview;
  String? updatedAt;
  String? updatedAtTimeStamp;
  String? userId;

  BookingData({
    this.calendarId,
    this.cancelNote,
    this.cancelReasonId,
    this.classReviewId,
    this.convertedLesson,
    this.createdAt,
    this.createdAtTimestamp,
    this.feedbacks,
    this.googleMeetLink,
    this.id,
    this.isDeleted,
    this.isTrial,
    this.lessonPlanId,
    this.recordUrl,
    this.scheduleDetailId,
    this.scheduleDetailInfo,
    this.scoreByTutor,
    this.showRecordByUrl,
    this.studentMaterials,
    this.studentMeetingLink,
    this.tutorReview,
    this.updatedAt,
    this.updatedAtTimeStamp,
    this.userId
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => _$BookingDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDataToJson(this);
}