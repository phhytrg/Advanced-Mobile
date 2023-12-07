

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/courses/domain/ebook.dart';
import 'package:lettutor/core/network/network_service.dart';

class EbookRepository{
  String baseUrl = "/e-book";

  final dio = NetworkService.instance.dio;

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
}

final ebookRepositoryProvider = Provider<EbookRepository>((ref) {
  return EbookRepository();
});