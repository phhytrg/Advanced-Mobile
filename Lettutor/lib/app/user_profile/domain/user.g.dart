// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      country: json['country'] as String,
      phone: json['phone'] as String,
      birthday: json['birthday'] as String,
      studySchedule: json['studySchedule'] as String,
      level: json['level'] as String,
      language: json['language'] as String,
      walletInfo:
          WalletInfo.fromJson(json['walletInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday,
      'studySchedule': instance.studySchedule,
      'level': instance.level,
      'walletInfo': instance.walletInfo,
    };

WalletInfo _$WalletInfoFromJson(Map<String, dynamic> json) => WalletInfo(
      amount: json['amount'] as String,
      isBlocked: json['isBlocked'] as bool,
      bonus: json['bonus'] as int,
    );

Map<String, dynamic> _$WalletInfoToJson(WalletInfo instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'isBlocked': instance.isBlocked,
      'bonus': instance.bonus,
    };
