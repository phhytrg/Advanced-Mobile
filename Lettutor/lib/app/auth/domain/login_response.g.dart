// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      tokens: Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };

Tokens _$TokensFromJson(Map<String, dynamic> json) => Tokens(
      access: Token.fromJson(json['access'] as Map<String, dynamic>),
      refresh: Token.fromJson(json['refresh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      token: json['token'] as String,
      expires: json['expires'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires,
    };
