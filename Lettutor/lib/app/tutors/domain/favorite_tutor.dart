

import 'package:json_annotation/json_annotation.dart';

part 'favorite_tutor.g.dart';
@JsonSerializable()
class FavoriteTutor{
  String? id;
  String? firstId;
  String? secondId;
  String? createdAt;
  String? updatedAt;
  String? secondInfo;

  FavoriteTutor({this.id, this.firstId, this.secondId, this.createdAt,
      this.updatedAt, this.secondInfo});

  factory FavoriteTutor.fromJson(Map<String, dynamic> json) => _$FavoriteTutorFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteTutorToJson(this);
}