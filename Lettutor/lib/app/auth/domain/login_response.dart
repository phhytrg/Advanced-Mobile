

import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/app/auth/domain/user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final User user;
  final Tokens tokens;

  LoginResponse({required this.user, required this.tokens});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Tokens {
  final Token access;
  final Token refresh;

  Tokens({required this.access, required this.refresh});

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
  Map<String, dynamic> toJson() => {
    'access': access.toJson(),
    'refresh': refresh.toJson(),
  };
}

@JsonSerializable()
class Token {
  final String token;
  final String expires;

  Token({required this.token, required this.expires});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => {
    'token': token,
    'expires': expires,
  };
}