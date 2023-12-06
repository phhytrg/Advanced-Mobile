

import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/app/tutors/domain/tutor_schedule/tutor_schedule_response.dart';

import '../../../tutors/domain/response/tutor.dart';

part 'booking_list_response.g.dart';

@JsonSerializable()
class BookingListResponse{
  String message;
  BookingList data;

  BookingListResponse({required this.message, required this.data});

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
  List<Object>? studentMaterials;
  String? studentMeetingLink;
  String? studentRequest;
  String? trailBookingReview;
  String? tutorMeetingLink;
  String? tutorReview;
  String? updatedAt;
  int? updatedAtTimeStamp;
  String? userId;

  BookingData(
      {this.calendarId,
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
      this.studentRequest,
      this.trailBookingReview,
      this.tutorMeetingLink,
      this.tutorReview,
      this.updatedAt,
      this.updatedAtTimeStamp,
      this.userId
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => _$BookingDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDataToJson(this);
}
