
import 'package:lettutor/app/messages/data/messages_repository.dart';
import 'package:lettutor/app/messages/domain/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_message_controller.g.dart';

@riverpod
class DetailMessageController extends _$DetailMessageController{
  var page = 1;
  final size = 25;
  @override
  Future<List<Message>> build(String id) async {
    page = 1;
    final repo = ref.read(messageRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repo.getMessages(id, page, size));
    return state.valueOrNull!;
  }

  Future<List<Message>> loadMore(String id) async {
    final repo = ref.read(messageRepositoryProvider);
    page++;
    final newState = await AsyncValue.guard(() => repo.getMessages(id, page, size));
    state = AsyncData(state.valueOrNull! + newState.valueOrNull!);
    return state.valueOrNull!;
  }
}