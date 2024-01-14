
import 'message.dart';

class Recipient {
  final String id;
  final String content;
  final Info fromInfo;
  final Info toInfo;

  Recipient({
    required this.id,
    required this.content,
    required this.fromInfo,
    required this.toInfo,
  });

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(
      id: json['id'],
      content: json['content'],
      fromInfo: Info.fromJson(json['fromInfo']),
      toInfo: Info.fromJson(json['toInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'fromInfo': fromInfo.toJson(),
      'toInfo': toInfo.toJson(),
    };
  }
}
