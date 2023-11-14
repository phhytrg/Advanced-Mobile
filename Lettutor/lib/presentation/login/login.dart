
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../appbar.dart';
import 'login_form.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
  
}

class _LoginPageState extends State<LoginPage>{

  bool isMobile(BuildContext context){
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginAppbar(),
      body: SingleChildScrollView(
        child:
        (isMobile(context)) ?
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image(
                  image: Image.asset('images/login-image.png').image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              LoginForm(),
            ],
          )
            :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 64),
                width: MediaQuery.of(context).size.width / 3,
                child: LoginForm(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image(
                  image: Image.asset('images/login-image.png').image,
                  fit: BoxFit.fitHeight,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height * 0.8,
                ),
              ),
            ],
          )
        )
    );
  }


}
