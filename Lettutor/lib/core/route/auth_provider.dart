

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/auth/data/token_repository.dart';

final authStateProvider = ChangeNotifierProvider<AuthState>((ref) {
  return AuthState();
});


class AuthState extends ChangeNotifier {
  bool loggedIn = false;

  void login() {
    loggedIn = true;
    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    notifyListeners();
  }
}