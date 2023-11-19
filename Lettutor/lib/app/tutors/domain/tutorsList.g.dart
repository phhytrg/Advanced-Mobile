// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorsList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorsList _$TutorsListFromJson(Map<String, dynamic> json) => TutorsList(
      tutors: json['tutors'] == null
          ? null
          : Tutors.fromJson(json['tutors'] as Map<String, dynamic>),
      favoriteTutor: (json['favoriteTutor'] as List<dynamic>?)
          ?.map((e) => FavoriteTutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorsListToJson(TutorsList instance) =>
    <String, dynamic>{
      'tutors': instance.tutors,
      'favoriteTutor': instance.favoriteTutor,
    };
