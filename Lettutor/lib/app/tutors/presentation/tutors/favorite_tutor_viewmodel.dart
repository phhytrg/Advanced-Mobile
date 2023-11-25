
import 'package:lettutor/app/tutors/service/tutors_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorite_tutor_viewmodel.g.dart';

@riverpod
class FavoriteTutorViewModel extends _$FavoriteTutorViewModel{

  @override
  FutureOr<void> build(){

  }

  TutorService get tutorService => ref.read(tutorServiceProvider);

  Future<void> updateTutorInFavoriteList(String tutorId) async{
    state = AsyncLoading();
    state = await AsyncValue.guard(() => tutorService.updateTutorInFavoriteList(tutorId));
  }
}