import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lettutor/app/auth/domain/user.dart';

import '../../app/auth/domain/login_response.dart';

class AuthState extends ChangeNotifier {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  bool loggedIn = false;

  void login(Tokens tokens) async {
    loggedIn = true;
    secureStorage.write(key: 'token', value: jsonEncode(tokens.toJson()));
    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    notifyListeners();
  }

  Future init() async {
    final localToken = await secureStorage.read(key: 'token');
    print(localToken.toString());
    if(localToken == null) return;
    final String accessToken = jsonDecode(localToken)['access']['token'];
    if (!JwtDecoder.isExpired(accessToken)) {
      loggedIn = true;
      notifyListeners();
    }
  }
}
