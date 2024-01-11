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

  Future<EbookList> filter(
      {String? query, List<String>? level, List<String>? order, String? orderBy, List<String>? categoryIds}) async {
    final ebookRepo = ref.read(ebookRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ebookRepo.filter(
          query: query,
          page: 1,
          size: 100,
          level: level,
          order: order,
          orderBy: orderBy,
          categoryIds: categoryIds,
        ));
    return state.valueOrNull ?? EbookList(count: 0, rows: []);
  }
}
