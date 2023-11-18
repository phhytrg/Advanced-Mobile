
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/user.dart';

abstract class AuthRepository{
  Future<User?> login(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> signOut();
  Stream<String?> authStateChanges();
}

class FakeAuthRepository extends AuthRepository{
  @override
  Stream<String?> authStateChanges() {
    // TODO: implement authStateChanges
    final StreamController<String> tokenController = StreamController<String>();

    // Simulate receiving the token from the backend periodically
    Timer.periodic(Duration(seconds: 5), (_) {
      final token = 'your_received_token'; // Replace with the actual token received from the backend
      tokenController.add(token);
    });

    return tokenController.stream;
  }

  @override
  Future<User?> login(String email, String password) {
    return Future.delayed(const Duration(seconds: 1), () {
      if(email == 'admin@gmail.com'){
        return User(
          id: '1',
        );
      }
      return null;
    });
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // return a concrete implementation of AuthRepository
  return FakeAuthRepository();
});
