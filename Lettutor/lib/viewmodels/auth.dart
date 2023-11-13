import 'package:flutter/material.dart';

import '../models/user.dart';

class AuthViewModel extends ChangeNotifier{

  late User? currentUser;

  void loginSuccess(User user){
    currentUser = user;
    notifyListeners();
  }

  void logout(){
    currentUser = null;
    notifyListeners();
  }
}