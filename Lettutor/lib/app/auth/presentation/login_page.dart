
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/app/auth/data/token_repository.dart';
import 'package:lettutor/core/constant.dart';
import 'package:lettutor/core/presentation/notification.dart';
import 'package:lettutor/core/route/router.dart';

import '../../../core/commom-widgets/appbar.dart';
import '../domain/user.dart';
import '../../../core/route/auth_provider.dart';
import 'controller/login_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, required this.authState});
  final AuthState authState;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  void onForgotPasswordClick() {
    context.go(AppRoute.resetPassword.getPath());
  }

  void onSignupClick() {
    context.go(AppRoute.signup.getPath());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LoginAppbar(),
        body: SingleChildScrollView(
            child: (isMobile(context))
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image(
                          image: Image.asset('images/login-image.png').image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      buildLoginForm(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: MediaQuery.of(context).size.width > 1200
                            ? const EdgeInsets.only(left: 80)
                            : const EdgeInsets.only(left: 16),
                        width: 480,
                        // child: FilledButton(
                        //   onPressed: (){
                        //     Provider.of<LoginViewModel>(context, listen:false).login("a","a");
                        //   },
                        //   child: Text("Click me"),
                        // ),
                        child: buildLoginForm(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image(
                            image: Image.asset('images/login-image.png').image,
                            fit: BoxFit.scaleDown,
                            height: MediaQuery.of(context).size.height * 0.8,
                          ),
                        ),
                      ),
                    ],
                  )));
  }

  Widget buildLoginForm() {
    final AsyncValue<void> state = ref.watch(loginControllerProvider);

    ref.listen<AsyncValue>(loginControllerProvider, (_, state) {
      state.showSnackBarOnError(context);
    });

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
                    )),
              ),
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!emailValidator.hasMatch(value)) {
                  return 'Please enter a valid email';
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
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
              text: "Forgot Password?",
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = onForgotPasswordClick,
            )),
            const SizedBox(
              height: 10,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return FilledButton(
                  onPressed: state.isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            var result = await ref
                                .read(loginControllerProvider.notifier)
                                .login(emailController.text,
                                    passwordController.text);
                            if (mounted && result != null) {
                              widget.authState.login(result.tokens);
                              context.go('/tutors');
                            }
                          }
                        },
                  style: const ButtonStyle(),
                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "LOG IN",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Or continue with",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member yet? "),
                RichText(
                  text: TextSpan(
                    text: "Sign up",
                    recognizer: TapGestureRecognizer()..onTap = onSignupClick,
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
      ),
    );
  }
}
