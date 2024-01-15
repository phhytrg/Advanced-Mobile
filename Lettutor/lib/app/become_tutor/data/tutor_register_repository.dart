

import 'package:dio/dio.dart';
import 'package:lettutor/core/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tutor_register_repository.g.dart';

@riverpod
Future<bool> registerTutor(RegisterTutorRef ref, Map<String, dynamic> data) async {
  final Dio dio = ref.read(dioProvider);
  var formData = FormData.fromMap(data);
  final response = await dio.put(
    '/tutor/register',
    data: formData,
  );
  return response.statusCode == 200;
}