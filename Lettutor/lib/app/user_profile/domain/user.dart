
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String email;
  String name;
  String avatar;
  String country;
  String phone;
  String language;
  String birthday;
  String studySchedule;
  String level;
  WalletInfo walletInfo;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.birthday,
    required this.studySchedule,
    required this.level,
    required this.language,
    required this.walletInfo,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}

@JsonSerializable()
class WalletInfo {
  String amount;
  bool isBlocked;
  int bonus;

  WalletInfo({
    required this.amount,
    required this.isBlocked,
    required this.bonus,
  });

  factory WalletInfo.fromJson(Map<String, dynamic> json) => _$WalletInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WalletInfoToJson(this);
}

