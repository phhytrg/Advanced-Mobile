
import 'package:dio/dio.dart';
import 'package:lettutor/app/messages/domain/message.dart';
import 'package:lettutor/app/messages/domain/recipient.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages_repository.g.dart';

class MessageRepository {
  final Dio dio;

  MessageRepository({required this.dio});

  String baseUrl = '/message';

  Future<List<Message>> getMessages(String id, int page, int size) async {
    final response = await dio.get('/message/get/$id', queryParameters: {
      'page': page,
      'perPage': size,
      'startTime': DateTime.now().millisecondsSinceEpoch,
    });

    return response.data['rows'].map<Message>((e) => Message.fromJson(e)).toList();
  }

  Future<List<Recipient>> getAllRecipients() async {
    final response = await dio.get('$baseUrl/get-all-recipient');
    return response.data['messages'].map<Recipient>((e) => Recipient.fromJson(e)).toList();
  }
}

@Riverpod(keepAlive: true)
MessageRepository messageRepository(MessageRepositoryRef ref) {
  return MessageRepository(dio: ref.read(dioProvider));
}