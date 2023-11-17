import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/app/signup/service/signup_service.dart';
import 'package:lettutor/core/network/network_service.dart';

import '../presentation/signup.dart';

abstract class SignupViewModel extends State<SignupPage>{
  late final Dio dio;

  Future<bool> signup(String email, String password){
    return SignupService(dio: Dio()).signup(email, password);
  }

  @override
  void initState() {
    super.initState();
    dio = NetworkService.instance.dio;
  }
}