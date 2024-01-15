// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutors _$TutorsFromJson(Map<String, dynamic> json) => Tutors(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Tutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorsToJson(Tutors instance) => <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };
