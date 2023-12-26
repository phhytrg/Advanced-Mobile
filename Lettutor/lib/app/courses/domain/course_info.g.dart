// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseInfo _$CourseInfoFromJson(Map<String, dynamic> json) => CourseInfo(
      description: json['description'] as String,
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      level: json['level'] as String,
      name: json['name'] as String,
      purpose: json['purpose'] as String,
      reason: json['reason'] as String,
      topics: (json['topics'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseInfoToJson(CourseInfo instance) =>
    <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'level': instance.level,
      'name': instance.name,
      'purpose': instance.purpose,
      'reason': instance.reason,
      'topics': instance.topics,
    };
