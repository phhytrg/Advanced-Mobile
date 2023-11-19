import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/tutor_repository.dart';
import '../domain/tutorsList.dart';

class TutorService{
  TutorService(this.ref);
  final Ref ref;

  Future<TutorsList?> getTutorsWithPagination(int perPage, int page) async {
    return await ref.read(tutorRepositoryProvider).fetchTutorsWithPagination(perPage, page);
  }
}

final tutorServiceProvider = Provider<TutorService>((ref) {
  return TutorService(ref);
});