import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/app/tutors/domain/tutor_schedule/tutor_schedule_response.dart';

import '../../../tutors/domain/response/tutor.dart';

part 'booking_list_response.g.dart';

@JsonSerializable()
class BookingListResponse {
  String message;
  BookingList data;

  BookingListResponse({required this.message, required this.data});

  factory BookingListResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingListResponseToJson(this);
}

@JsonSerializable()
class BookingList {
  int count;
  List<BookingData>? rows;

  BookingList({required this.count, required this.rows});

  factory BookingList.fromJson(Map<String, dynamic> json) =>
      _$BookingListFromJson(json);

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
  List<Map<String, dynamic>>? feedbacks;
  String? googleMeetLink;
  String? id;
  bool? isDeleted;
  bool? isTrial;
  // String? lessonPlanId;
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
  ClassReview? classReview;

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
      // this.lessonPlanId,
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
      this.userId,
      this.classReview,
      });

  factory BookingData.fromJson(Map<String, dynamic> json) =>
      _$BookingDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDataToJson(this);
}

@JsonSerializable()
class ClassReview {
  String? behaviorComment;
  int? behaviorRating;
  String? book;
  String? homeworkComment;
  int? listeningRating;
  String? listeningComment;
  int? speakingRating;
  String? speakingComment;
  int? vocabularyRating;
  String? vocabularyComment;
  String? overallComment;
  LessonStatus? lessonStatus;

  ClassReview(
      {this.behaviorComment,
      this.behaviorRating,
      this.book,
      this.homeworkComment,
      this.listeningRating,
      this.listeningComment,
      this.speakingRating,
      this.speakingComment,
      this.vocabularyRating,
      this.vocabularyComment,
      this.overallComment,
      this.lessonStatus});

  factory ClassReview.fromJson(Map<String, dynamic> json) =>
      _$ClassReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ClassReviewToJson(this);
}

@JsonSerializable()
class LessonStatus{
  String? status;

  LessonStatus({this.status});

  factory LessonStatus.fromJson(Map<String, dynamic> json) =>
      _$LessonStatusFromJson(json);
  Map<String, dynamic> toJson() => _$LessonStatusToJson(this);
}
