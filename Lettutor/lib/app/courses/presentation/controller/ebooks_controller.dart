import 'package:lettutor/app/courses/data/ebook_repository.dart';
import 'package:lettutor/app/courses/domain/ebook.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ebooks_controller.g.dart';

@riverpod
class EbooksController extends _$EbooksController {
  var page = 1;
  final size = 20;

  @override
  Future<EbookList> build() async {
    return fetchEbook(page, size);
  }

  Future<EbookList> fetchEbook(int page, int perPage) async {
    final ebookRepository = ref.read(ebookRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ebookRepository.fetchEbook(page, perPage));
    page++;
    return state.valueOrNull ?? EbookList(count: 0, rows: []);
  }

  Future<EbookList> filter(
      {String? query, List<String>? level, List<String>? order, String? orderBy, List<String>? categoryIds}) async {
    final ebookRepo = ref.read(ebookRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ebookRepo.filter(
          query: query,
          page: page,
          size: size,
          level: level,
          order: order,
          orderBy: orderBy,
          categoryIds: categoryIds,
        ));
    return state.valueOrNull ?? EbookList(count: 0, rows: []);
  }

  Future<EbookList?> loadMore(
      {String? query, List<String>? level, List<String>? order, String? orderBy, List<String>? categories}) async {
    final repo = ref.read(ebookRepositoryProvider);

    if (state.value == null) {
      state = await AsyncValue.guard(() => repo.filter(
            query: query,
            page: page,
            size: size,
            // level: level,
            // order: order,
            // orderBy: orderBy,
            // categoryIds: categories,
          ));
      page++;
      return state.valueOrNull;
    }
    final newState = await AsyncValue.guard(() => repo.filter(
          query: query,
          page: page,
          size: size,
          // level: level,
          // order: order,
          // orderBy: orderBy,
          // categoryIds: categories,
        ));
    state = AsyncData(EbookList(count: state.value!.count, rows: [...state.value!.rows!, ...newState.value!.rows]));
    page++;

    return state.valueOrNull;
  }
}
