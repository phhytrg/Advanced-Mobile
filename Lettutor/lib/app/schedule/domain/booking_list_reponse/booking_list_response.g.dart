// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingListResponse _$BookingListResponseFromJson(Map<String, dynamic> json) =>
    BookingListResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : BookingList.fromJson(json['data'] as Map<String, dynamic>),
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
          ?.map((e) => e as String)
          .toList(),
      googleMeetLink: json['googleMeetLink'] as String?,
      id: json['id'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isTrial: json['isTrial'] as bool?,
      lessonPlanId: json['lessonPlanId'] as String?,
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
      'lessonPlanId': instance.lessonPlanId,
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
    };
