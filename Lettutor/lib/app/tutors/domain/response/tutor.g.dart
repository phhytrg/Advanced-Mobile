// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutor _$TutorFromJson(Map<String, dynamic> json) => Tutor(
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      isNative: json['isNative'] as String?,
      specialties: json['specialties'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
      schedulesTimes: json['schedulesTimes'] as int?,
      isFavoriteTutor: json['isFavoriteTutor'] as bool?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$TutorToJson(Tutor instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'country': instance.country,
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'isNative': instance.isNative,
      'specialties': instance.specialties,
      'rating': instance.rating,
      'userId': instance.userId,
      'schedulesTimes': instance.schedulesTimes,
      'isFavoriteTutor': instance.isFavoriteTutor,
      'price': instance.price,
    };
