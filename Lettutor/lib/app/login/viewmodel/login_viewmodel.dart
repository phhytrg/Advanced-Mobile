import 'dart:async';

import 'package:lettutor/core/route/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/domain/user.dart';
import '../data/auth_repository.dart';
part 'login_viewmodel.g.dart';

// class LoginViewModel with ChangeNotifier{
//   late final AuthService authService;
//   late final Dio dio;
//
//   LoginViewModel(){
//     dio = NetworkService.instance.dio;
//     authService = AuthService(dio: dio);
//   }
//
//   Future<String> login(String email, String password) async{
//     final response = await authService.login(email, password);
//     return response;
//   }
//
//   Future<void> resetPassword(String email) async{
//
//   }
// }


@riverpod
class LoginViewModel extends _$LoginViewModel{

  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<User?> login(String email, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard<User?>(() => authRepository.login(email, password));
    return state.valueOrNull;
  }

}