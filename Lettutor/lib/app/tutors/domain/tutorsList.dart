import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/app/tutors/domain/favorite_tutor.dart';
import 'package:lettutor/app/tutors/domain/tutors.dart';
import 'tutor.dart';

part 'tutorsList.g.dart';
@JsonSerializable()
class TutorsList {
  Tutors? tutors;
  List<FavoriteTutor>? favoriteTutor;

  TutorsList({this.tutors, this.favoriteTutor});

  factory TutorsList.fromJson(Map<String, dynamic> json) => _$TutorsListFromJson(json);
  Map<String, dynamic> toJson() => _$TutorsListToJson(this);
}