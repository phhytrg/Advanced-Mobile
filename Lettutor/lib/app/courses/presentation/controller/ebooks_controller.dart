
import 'package:lettutor/app/courses/data/ebook_repository.dart';
import 'package:lettutor/app/courses/domain/ebook.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ebooks_controller.g.dart';
@riverpod
class EbooksController extends _$EbooksController {
  @override
  Future<EbookList> build() async {
    return fetchEbook(1, 100);
  }

  Future<EbookList> fetchEbook(int page, int perPage) async {
    final ebookRepository = ref.read(ebookRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ebookRepository.fetchEbook(page, perPage));
    return state.valueOrNull ?? EbookList(count: 0, rows: []);
  }
}