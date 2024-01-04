
import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@JsonSerializable()
class FeedbackResponse{
  final String? message;
  final FeedbackList? data;

  FeedbackResponse(this.data, this.message);

  factory FeedbackResponse.fromJson(Map<String, dynamic> json) => _$FeedbackResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackResponseToJson(this);
}

@JsonSerializable()
class FeedbackList{
  final int count;
  final List<FeedbackData> rows;

  FeedbackList({required this.count, required this.rows});

  factory FeedbackList.fromJson(Map<String, dynamic> json) => _$FeedbackListFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackListToJson(this);
}

@JsonSerializable()
class FeedbackData{
  final String id;
  final String bookingId;
  final String firstId;
  final String secondId;
  final int rating;
  final String content;
  final String createdAt;
  final String updatedAt;
  final FirstInfo firstInfo;

  FeedbackData(this.id, this.bookingId, this.firstId, this.secondId, this.rating,
      this.content, this.createdAt, this.updatedAt, this.firstInfo);

  factory FeedbackData.fromJson(Map<String, dynamic> json) => _$FeedbackDataFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackDataToJson(this);
}

@JsonSerializable()
class FirstInfo{
  final String name;
  final String avatar;

  FirstInfo(this.name, this.avatar);

  factory FirstInfo.fromJson(Map<String, dynamic> json) => _$FirstInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FirstInfoToJson(this);
}