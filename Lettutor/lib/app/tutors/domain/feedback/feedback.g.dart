// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackResponse _$FeedbackResponseFromJson(Map<String, dynamic> json) =>
    FeedbackResponse(
      json['data'] == null
          ? null
          : FeedbackList.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String?,
    );

Map<String, dynamic> _$FeedbackResponseToJson(FeedbackResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

FeedbackList _$FeedbackListFromJson(Map<String, dynamic> json) => FeedbackList(
      json['count'] as int,
      (json['rows'] as List<dynamic>)
          .map((e) => FeedbackData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedbackListToJson(FeedbackList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };

FeedbackData _$FeedbackDataFromJson(Map<String, dynamic> json) => FeedbackData(
      json['id'] as String,
      json['bookingId'] as String,
      json['firstId'] as String,
      json['secondId'] as String,
      json['rating'] as int,
      json['content'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      FirstInfo.fromJson(json['firstInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackDataToJson(FeedbackData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
      'rating': instance.rating,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'firstInfo': instance.firstInfo,
    };

FirstInfo _$FirstInfoFromJson(Map<String, dynamic> json) => FirstInfo(
      json['name'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$FirstInfoToJson(FirstInfo instance) => <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
    };
