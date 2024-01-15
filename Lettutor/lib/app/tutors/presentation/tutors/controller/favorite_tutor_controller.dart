
import 'package:lettutor/app/tutors/service/tutors_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorite_tutor_controller.g.dart';

@riverpod
class FavoriteTutorController extends _$FavoriteTutorController{

  @override
  FutureOr<void> build(){

  }

  TutorService get tutorService => ref.read(tutorServiceProvider);

  Future<void> updateTutorInFavoriteList(String tutorId) async{
    state = AsyncLoading();
    state = await AsyncValue.guard(() => tutorService.updateTutorInFavoriteList(tutorId));
  }
}