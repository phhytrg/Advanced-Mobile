// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorList _$TutorListFromJson(Map<String, dynamic> json) => TutorList(
      count: json['count'] as int,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Tutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorListToJson(TutorList instance) => <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };
