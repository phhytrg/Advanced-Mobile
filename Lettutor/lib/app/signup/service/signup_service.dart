import 'package:dio/dio.dart';

class SignupService{

  final Dio dio;

  SignupService({required this.dio});

  Future<bool> signup(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

}

enum SignupPath{
  signup,
  verifyAccount,
  sendOtp,
  activateViaOtp,
  phoneRegister
}

extension ServiceSignupPath on SignupPath{
  String getString(){
    switch(this){
      case SignupPath.signup:
        return '/auth/signup';
      case SignupPath.sendOtp:
        return '/verify/phone-auth-verify/create';
      case SignupPath.activateViaOtp:
        return '/verify/phone-auth-verify/activate';
      case SignupPath.verifyAccount:
        return '/auth/verifyAccount';
      case SignupPath.phoneRegister:
        return '/auth/phone-register';
    }
  }
}