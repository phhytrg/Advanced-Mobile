import 'package:lettutor/app/messages/domain/message.dart';

class MessagesResponse{
  final int count;
  final List<Message> rows;

  MessagesResponse({
    required this.count,
    required this.rows,
  });

  factory MessagesResponse.fromJson(Map<String, dynamic> json) {
    return MessagesResponse(
      count: json['count'],
      rows: json['rows'].map<Message>((e) => Message.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'rows': rows.map((e) => e.toJson()).toList(),
    };
  }
}