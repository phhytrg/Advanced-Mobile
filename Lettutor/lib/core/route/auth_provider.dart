

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/login/data/auth_repository.dart';
import 'package:lettutor/app/login/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthState{

  bool isAuthenticated = false;
  @override
  FutureOr<bool?> build() {
    return null;
  }

  void setAuthenticated(bool isAuthenticated){
    this.isAuthenticated = isAuthenticated;
  }
}

final authStateProvider = StateProvider<User?>((ref) {
  return null;
});
