import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/app/login/presentation/login.dart';
import 'package:lettutor/main.dart';
import '../../../core/network/network_service.dart';
import '../service/auth_service.dart';

abstract class LoginViewModel extends State<LoginPage>{
  late final AuthService authService;
  final Dio dio = NetworkService.instance.dio;


  @override
  void initState() {
    super.initState();
    authService = AuthService(dio: dio);
  }

  Future<void> fetchUserLogin(String email, String password) async{
    final response = await authService.login(email, password);
    if(response && context.mounted){
      Navigator.pushNamed(context, RoutePath.tutorsList.getString());
      return;
    }else if(context.mounted && !response){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Login Credentials"),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  Future<void> resetPassword(String email) async{

  }
}