import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/app/login/viewmodel/login_viewmodel.dart';

import '../../presentation/appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }

}

class _LoginPageState extends LoginViewModel {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isMobile(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width < 600;
  }

  void onLoginButtonClick() {
    fetchUserLogin(emailController.text, passwordController.text);

  }

  void onForgotPasswordClick() {
  }

  void onSignupClick() {
    Navigator.pushNamed(
        context,
        '/signup'
    );
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
                    image: Image
                        .asset('images/login-image.png')
                        .image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                buildLoginForm(),
              ],
            )
                :
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 64),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  child: buildLoginForm(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image(
                    image: Image
                        .asset('images/login-image.png')
                        .image,
                    fit: BoxFit.fitHeight,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.8,
                  ),
                ),
              ],
            )
        )
    );
  }

  Widget buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Say hello to your English tutors",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[600],
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width < 600 ? 28 : 40,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Text(
            "Become fluent faster through one on one video chat lessons tailored to your goals.",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "EMAIL",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
              fontWeight: FontWeight.w100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "main@example.com",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.lightBlue,
                    width: 1.3,
                  )
              ),
            ),
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "PASSWORD",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
              fontWeight: FontWeight.w100,
            ),
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    gapPadding: 1,
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    gapPadding: 1,
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.lightBlue,
                      width: 1.3,
                    )
                )
            ),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            controller: passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                text: "Forgot Password?",
                style: const TextStyle(
                    color: Colors.blue
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = onForgotPasswordClick,
              )
          ),
          const SizedBox(
            height: 10,
          ),
          FilledButton(
              onPressed: onLoginButtonClick,
              style: const ButtonStyle(

              ),
              child: const Text(
                "LOG IN",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
          ),
          SizedBox(
            height: 40,
          ),
          Text("Or continue with", textAlign: TextAlign.center,),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: const CircleBorder()
                  ),
                  child: const Icon(Icons.facebook, color: Colors.blue,)
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    shape: const CircleBorder()
                ),
                child: SvgPicture.asset('/icons/google.svg', height: 24,),
              ),
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: const CircleBorder()
                  ),
                  child: const Icon(Icons.phone_android, color: Colors.blue,)
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Not a member yet? "),
              RichText(
                text: TextSpan(
                  text: "Sign up",
                  recognizer: TapGestureRecognizer()
                    ..onTap = onSignupClick,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }

}
