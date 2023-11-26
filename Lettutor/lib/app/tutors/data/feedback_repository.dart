import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/network_service.dart';
import '../domain/feedback/feedback.dart';

class FeedbackRepository {

  final Dio dio = NetworkService.instance.dio;
  final String baseUrl = "/feedback/v2";

  Future<FeedbackList?> getFeedback(String tutorId, int page, int perPage) async {
    Response response = await dio.get(
      '$baseUrl/$tutorId',
      queryParameters: {
        "page": page,
        "perPage": perPage,
      },
    );
    FeedbackResponse feedbackResponse = FeedbackResponse.fromJson(response.data);
    return feedbackResponse.data;
  }
}

final feedbackRepositoryProvider = Provider<FeedbackRepository>((ref) {
  return FeedbackRepository();
});