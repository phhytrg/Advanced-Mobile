
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/domain/user.dart';

part 'tutor.g.dart';

@JsonSerializable()
class Tutor{
  String? avatar;
  String? country;
  String? id;
  String? name;
  String? bio;
  bool? isNative;
  String? specialties;
  double? rating;
  String? userId;
  int? schedulesTimes;
  bool? isFavoriteTutor;
  int? price;
  String? video;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? interests;
  String? languages;
  @JsonKey(name: 'User')
  User? user;


  Tutor({
      this.avatar,
      this.country,
      this.id,
      this.name,
      this.bio,
      this.isNative,
      this.specialties,
      this.rating,
      this.userId,
      this.schedulesTimes,
      this.isFavoriteTutor,
      this.price,
      this.video,
      this.education,
      this.experience,
      this.profession,
      this.accent,
      this.targetStudent,
      this.interests,
      this.languages,
      this.user
  });

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
  Map<String, dynamic> toJson() => _$TutorToJson(this);
}