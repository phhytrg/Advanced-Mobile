
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appbar.dart';
import 'signup_form.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupPageState();
  }

}

class _SignupPageState extends State<SignupPage>{

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
                SignupForm(),
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
                  child: SignupForm(),
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
