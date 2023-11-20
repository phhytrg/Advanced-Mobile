

import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/app/tutors/domain/first_info.dart';
import 'package:lettutor/app/tutors/domain/second_info.dart';

part 'favorite_tutor.g.dart';
@JsonSerializable()
class FavoriteTutor{
  String? id;
  String? firstId;
  String? secondId;
  String? createdAt;
  String? updatedAt;
  // List<SecondInfo>? secondInfo;

  FavoriteTutor({this.id, this.firstId, this.secondId, this.createdAt,
      this.updatedAt});

  factory FavoriteTutor.fromJson(Map<String, dynamic> json) => _$FavoriteTutorFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteTutorToJson(this);
  // factory FavoriteTutor.fromJson(Map<String, dynamic> json) => _$FavoriteTutorFromJson(json);
  // Map<String, dynamic> toJson() => _$FavoriteTutorToJson(this);
}