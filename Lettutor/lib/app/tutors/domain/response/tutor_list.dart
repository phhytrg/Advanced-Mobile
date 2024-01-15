import 'package:json_annotation/json_annotation.dart';

import 'tutor.dart';


part 'tutor_list.g.dart';

@JsonSerializable()
class TutorList{
  int count;
  List<Tutor>? rows;

  TutorList({required this.count, required this.rows});
  factory TutorList.fromJson(Map<String, dynamic> json) => _$TutorListFromJson(json);
  Map<String, dynamic> toJson() => _$TutorListToJson(this);
}