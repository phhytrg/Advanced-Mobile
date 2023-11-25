import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/app/signup/viewmodel/signup_controller.dart';
import 'package:lettutor/core/constant.dart';
import '../../../core/commom-widgets/appbar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends SignupController {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const LoginAppbar(),
        body: SingleChildScrollView(
            child: (isMobile(context))
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image(
                          image: Image.asset('images/login-image.png').image,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      _buildSignUpForm(),
                    ],
                  )
                : SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: MediaQuery.of(context).size.width > 1200
                              ? const EdgeInsets.only(left: 80)
                              : const EdgeInsets.only(left: 16),
                          width: 480,
                          child: _buildSignUpForm(),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image(
                              image:
                                  Image.asset('images/login-image.png').image,
                              fit: BoxFit.scaleDown,
                              height:
                                  MediaQuery.of(context).size.height * 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )));
  }

  Widget _buildSignUpForm() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: _formKey,
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
                  fontSize: MediaQuery.of(context).size.width < 600 ? 28 : 40,
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
            TextFormField(
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
                      )),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.lightBlue,
                        width: 1.3,
                      ))),
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if(!emailValidator.hasMatch(value)){
                  return 'Please enter valid email';
                }
                return null;
              },
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
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      )),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.lightBlue,
                        width: 1.3,
                      ))),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Re-PASSWORD",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
                fontWeight: FontWeight.w100,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      )),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.lightBlue,
                        width: 1.3,
                      ))),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your re-password";
                }
                if (value != passwordController.text) {
                  return "The passwords you entered do not match";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
                onPressed: handleOnSignupClicked,
                style: ButtonStyle(),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Text(
              "Or continue with",
              textAlign: TextAlign.center,
            ),
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
                        shape: const CircleBorder()),
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    )),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: const CircleBorder()),
                  child: SvgPicture.asset(
                    '/icons/google.svg',
                    height: 24,
                  ),
                ),
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                        shape: const CircleBorder()),
                    child: const Icon(
                      Icons.phone_android,
                      color: Colors.blue,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void handleOnSignupClicked() async {
    if (_formKey.currentState!.validate()) {
      if (await signup(emailController.text, passwordController.text)) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Sign up successful. Please check your email to verify the account')));
      }
    }
  }
}
