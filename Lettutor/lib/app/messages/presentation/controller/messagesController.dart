

import 'package:lettutor/app/messages/data/messages_repository.dart';
import 'package:lettutor/app/messages/domain/message.dart';
import 'package:lettutor/app/messages/domain/recipient.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messagesController.g.dart';

@riverpod
class MessagesController extends _$MessagesController {

  @override
  Future<List<Recipient>> build() async {
    final repo = ref.read(messageRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repo.getAllRecipients());
    return state.valueOrNull!;
  }

  Future<List<Recipient>> getAllRecipients() async {
    final repo = ref.read(messageRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repo.getAllRecipients());
    return state.valueOrNull!;
  }
}