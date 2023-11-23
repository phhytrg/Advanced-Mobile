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
      isNative: json['isNative'] as bool?,
      specialties: json['specialties'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
      schedulesTimes: json['schedulesTimes'] as int?,
      isFavoriteTutor: json['isFavoriteTutor'] as bool?,
      price: json['price'] as int?,
      video: json['video'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      accent: json['accent'] as String?,
      targetStudent: json['targetStudent'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
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
      'video': instance.video,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'accent': instance.accent,
      'targetStudent': instance.targetStudent,
      'interests': instance.interests,
      'languages': instance.languages,
      'User': instance.user,
    };
