// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      level: json['level'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      language: json['language'] as String?,
      isPublicRecord: json['isPublicRecord'] as bool?,
      caredByStaffId: json['caredByStaffId'] as String?,
      zaloUserId: json['zaloUserId'] as String?,
      studentGroupId: json['studentGroupId'] as String?,
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'language': instance.language,
      'isPublicRecord': instance.isPublicRecord,
      'caredByStaffId': instance.caredByStaffId,
      'zaloUserId': instance.zaloUserId,
      'studentGroupId': instance.studentGroupId,
      'courses': instance.courses,
    };
