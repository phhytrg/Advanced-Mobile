import 'package:dio/dio.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/feedback/feedback.dart';

part 'feedback_repository.g.dart';

class FeedbackRepository {

  final Dio dio;
  final String baseUrl = "/feedback/v2";

  FeedbackRepository({required this.dio});

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

@Riverpod(keepAlive: true)
FeedbackRepository feedbackRepository(FeedbackRepositoryRef ref) {
  return FeedbackRepository(dio: ref.read(dioProvider));
}