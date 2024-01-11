import 'package:dio/dio.dart';
import 'package:lettutor/app/courses/domain/ebook.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ebook_repository.g.dart';

class EbookRepository {
  String baseUrl = "/e-book";
  final Dio dio;

  EbookRepository({required this.dio});

  Future<EbookList> fetchEbook(int page, int perPage) async {
    Response response = await dio.get(
      baseUrl,
      queryParameters: {
        "page": page,
        "size": perPage,
      },
    );

    Map<String, dynamic> jsonDecoded = response.data;
    return EbookList.fromJson(jsonDecoded["data"]);
  }

  Future<EbookList> filter(
      {String? query,
      required int page,
      required int size,
      List<String>? level,
      List<String>? order,
      String? orderBy,
      List<String>? categoryIds}) async {
    Response response = await dio.get(
      baseUrl,
      queryParameters: {
        'q': query,
        'page': page,
        'size': size,
        'level': level,
        'orderBy': [
          orderBy,
        ],
        'order': order,
        'categoryId': categoryIds,
      },
    );
    return EbookList.fromJson(response.data["data"]);
  }
}

@Riverpod(keepAlive: true)
EbookRepository ebookRepository(EbookRepositoryRef ref) {
  return EbookRepository(dio: ref.read(dioProvider));
}
