import 'dart:async';

import 'package:lettutor/app/auth/data/auth_repository.dart';
import 'package:lettutor/app/auth/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_controller.g.dart';


@riverpod
class LoginController extends _$LoginController{

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