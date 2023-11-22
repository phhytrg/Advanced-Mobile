
import 'package:json_annotation/json_annotation.dart';

part 'tutor.g.dart';
@JsonSerializable()
class Tutor{
  String? avatar;
  String? country;
  String? id;
  String? name;
  String? bio;
  String? isNative;
  String? specialties;
  double? rating;
  String? userId;
  int? schedulesTimes;
  bool? isFavoriteTutor;
  int? price;

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
  });

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
  Map<String, dynamic> toJson() => _$TutorToJson(this);
}