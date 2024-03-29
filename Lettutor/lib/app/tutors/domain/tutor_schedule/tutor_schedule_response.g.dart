// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorScheduleResponse _$TutorScheduleResponseFromJson(
        Map<String, dynamic> json) =>
    TutorScheduleResponse(
      message: json['message'] as String?,
      scheduleOfTutor: (json['scheduleOfTutor'] as List<dynamic>?)
          ?.map((e) => ScheduleOfTutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorScheduleResponseToJson(
        TutorScheduleResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'scheduleOfTutor': instance.scheduleOfTutor,
    };

ScheduleOfTutor _$ScheduleOfTutorFromJson(Map<String, dynamic> json) =>
    ScheduleOfTutor(
      id: json['id'] as String?,
      tutorId: json['tutorId'] as String?,
      startTime: json['startTime'] as String?,
      startTimestamp: json['startTimestamp'] as int?,
      endTimestamp: json['endTimestamp'] as int?,
      createdAt: json['createdAt'] as String?,
      isBooked: json['isBooked'] as bool?,
      scheduleDetails: (json['scheduleDetails'] as List<dynamic>?)
          ?.map((e) => ScheduleDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleOfTutorToJson(ScheduleOfTutor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'createdAt': instance.createdAt,
      'isBooked': instance.isBooked,
      'scheduleDetails': instance.scheduleDetails,
    };

ScheduleDetail _$ScheduleDetailFromJson(Map<String, dynamic> json) =>
    ScheduleDetail(
      startPeriodTimestamp: json['startPeriodTimestamp'] as int?,
      endPeriodTimestamp: json['endPeriodTimestamp'] as int?,
      id: json['id'] as String?,
      scheduleId: json['scheduleId'] as String?,
      startPeriod: json['startPeriod'] as String?,
      endPeriod: json['endPeriod'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      bookingInfo: (json['bookingInfo'] as List<dynamic>?)
          ?.map((e) => BookingInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBooked: json['isBooked'] as bool?,
      scheduleInfo: json['scheduleInfo'] == null
          ? null
          : ScheduleInfo.fromJson(json['scheduleInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleDetailToJson(ScheduleDetail instance) =>
    <String, dynamic>{
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'bookingInfo': instance.bookingInfo,
      'isBooked': instance.isBooked,
      'scheduleInfo': instance.scheduleInfo,
    };

BookingInfo _$BookingInfoFromJson(Map<String, dynamic> json) => BookingInfo(
      createdAtTimestamp: json['createdAtTimestamp'] as int?,
      updatedAtTimestamp: json['updatedAtTimestamp'] as int?,
      id: json['id'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] as String?,
      scheduleDetailId: json['scheduleDetailId'] as String?,
      updatedAt: json['updatedAt'] as String?,
      cancelReasonId: json['cancelReasonId'] as int?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$BookingInfoToJson(BookingInfo instance) =>
    <String, dynamic>{
      'createdAtTimestamp': instance.createdAtTimestamp,
      'updatedAtTimestamp': instance.updatedAtTimestamp,
      'id': instance.id,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'scheduleDetailId': instance.scheduleDetailId,
      'updatedAt': instance.updatedAt,
      'cancelReasonId': instance.cancelReasonId,
      'userId': instance.userId,
    };

ScheduleInfo _$ScheduleInfoFromJson(Map<String, dynamic> json) => ScheduleInfo(
      id: json['id'] as String?,
      tutorId: json['tutorId'] as String?,
      startTime: json['startTime'] as String?,
      startTimestamp: json['startTimestamp'] as int?,
      endTimestamp: json['endTimestamp'] as int?,
      createdAt: json['createdAt'] as String?,
      tutorInfo: json['tutorInfo'] == null
          ? null
          : Tutor.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleInfoToJson(ScheduleInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'createdAt': instance.createdAt,
      'tutorInfo': instance.tutorInfo,
    };
