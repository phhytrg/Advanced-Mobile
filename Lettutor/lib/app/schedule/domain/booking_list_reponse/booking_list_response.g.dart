// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingListResponse _$BookingListResponseFromJson(Map<String, dynamic> json) =>
    BookingListResponse(
      message: json['message'] as String,
      data: BookingList.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingListResponseToJson(
        BookingListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

BookingList _$BookingListFromJson(Map<String, dynamic> json) => BookingList(
      count: json['count'] as int,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => BookingData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingListToJson(BookingList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };

BookingData _$BookingDataFromJson(Map<String, dynamic> json) => BookingData(
      calendarId: json['calendarId'] as String?,
      cancelNote: json['cancelNote'] as String?,
      cancelReasonId: json['cancelReasonId'] as String?,
      classReviewId: json['classReviewId'] as String?,
      convertedLesson: json['convertedLesson'] as int?,
      createdAt: json['createdAt'] as String?,
      createdAtTimestamp: json['createdAtTimestamp'] as int?,
      feedbacks: (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      googleMeetLink: json['googleMeetLink'] as String?,
      id: json['id'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isTrial: json['isTrial'] as bool?,
      recordUrl: json['recordUrl'] as String?,
      scheduleDetailId: json['scheduleDetailId'] as String?,
      scheduleDetailInfo: json['scheduleDetailInfo'] == null
          ? null
          : ScheduleDetail.fromJson(
              json['scheduleDetailInfo'] as Map<String, dynamic>),
      scoreByTutor: (json['scoreByTutor'] as num?)?.toDouble(),
      showRecordByUrl: json['showRecordByUrl'] as bool?,
      studentMaterials: (json['studentMaterials'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
      studentMeetingLink: json['studentMeetingLink'] as String?,
      studentRequest: json['studentRequest'] as String?,
      trailBookingReview: json['trailBookingReview'] as String?,
      tutorMeetingLink: json['tutorMeetingLink'] as String?,
      tutorReview: json['tutorReview'] as String?,
      updatedAt: json['updatedAt'] as String?,
      updatedAtTimeStamp: json['updatedAtTimeStamp'] as int?,
      userId: json['userId'] as String?,
      classReview: json['classReview'] == null
          ? null
          : ClassReview.fromJson(json['classReview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingDataToJson(BookingData instance) =>
    <String, dynamic>{
      'calendarId': instance.calendarId,
      'cancelNote': instance.cancelNote,
      'cancelReasonId': instance.cancelReasonId,
      'classReviewId': instance.classReviewId,
      'convertedLesson': instance.convertedLesson,
      'createdAt': instance.createdAt,
      'createdAtTimestamp': instance.createdAtTimestamp,
      'feedbacks': instance.feedbacks,
      'googleMeetLink': instance.googleMeetLink,
      'id': instance.id,
      'isDeleted': instance.isDeleted,
      'isTrial': instance.isTrial,
      'recordUrl': instance.recordUrl,
      'scheduleDetailId': instance.scheduleDetailId,
      'scheduleDetailInfo': instance.scheduleDetailInfo,
      'scoreByTutor': instance.scoreByTutor,
      'showRecordByUrl': instance.showRecordByUrl,
      'studentMaterials': instance.studentMaterials,
      'studentMeetingLink': instance.studentMeetingLink,
      'studentRequest': instance.studentRequest,
      'trailBookingReview': instance.trailBookingReview,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'tutorReview': instance.tutorReview,
      'updatedAt': instance.updatedAt,
      'updatedAtTimeStamp': instance.updatedAtTimeStamp,
      'userId': instance.userId,
      'classReview': instance.classReview,
    };

ClassReview _$ClassReviewFromJson(Map<String, dynamic> json) => ClassReview(
      behaviorComment: json['behaviorComment'] as String?,
      behaviorRating: json['behaviorRating'] as int?,
      book: json['book'] as String?,
      homeworkComment: json['homeworkComment'] as String?,
      listeningRating: json['listeningRating'] as int?,
      listeningComment: json['listeningComment'] as String?,
      speakingRating: json['speakingRating'] as int?,
      speakingComment: json['speakingComment'] as String?,
      vocabularyRating: json['vocabularyRating'] as int?,
      vocabularyComment: json['vocabularyComment'] as String?,
      overallComment: json['overallComment'] as String?,
      lessonStatus: json['lessonStatus'] == null
          ? null
          : LessonStatus.fromJson(json['lessonStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClassReviewToJson(ClassReview instance) =>
    <String, dynamic>{
      'behaviorComment': instance.behaviorComment,
      'behaviorRating': instance.behaviorRating,
      'book': instance.book,
      'homeworkComment': instance.homeworkComment,
      'listeningRating': instance.listeningRating,
      'listeningComment': instance.listeningComment,
      'speakingRating': instance.speakingRating,
      'speakingComment': instance.speakingComment,
      'vocabularyRating': instance.vocabularyRating,
      'vocabularyComment': instance.vocabularyComment,
      'overallComment': instance.overallComment,
      'lessonStatus': instance.lessonStatus,
    };

LessonStatus _$LessonStatusFromJson(Map<String, dynamic> json) => LessonStatus(
      status: json['status'] as String?,
    );

Map<String, dynamic> _$LessonStatusToJson(LessonStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
