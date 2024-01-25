
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lettutor/core/constant.dart';
import 'package:lettutor/core/presentation/notification.dart';
import 'package:lettutor/core/route/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/common-widgets/appbar.dart';
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
        appBar: const LoginAppbar(),
        body: SingleChildScrollView(
            child: (isMobile(context))
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image(
                          image: Image.asset('assets/images/login-image.png').image,
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
    final txt = AppLocalizations.of(context)!;
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
                txt.sayHelloLettutor,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[600],
                  fontSize: MediaQuery.of(context).size.width < 600 ? 28 : 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              txt.lettutorIntro,
              style: const TextStyle(
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
                  return txt.pleaseEmail;
                }
                if (!emailValidator.hasMatch(value)) {
                  return txt.pleaseValidEmail;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              txt.password,
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
                  return txt.pleasePassword;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
              text: txt.forgotPassword,
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
                            if(result != null){
                              widget.authState.login(result.tokens);
                              if(mounted){
                                context.go('/tutors');
                              }
                            }
                          }
                        },
                  style: const ButtonStyle(),
                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          txt.login.toUpperCase(),
                          style: const TextStyle(
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
            Text(
              txt.orContinueWith,
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
                  onPressed: () async {
                    const List<String> scopes = <String>[
                      'email',
                      'https://www.googleapis.com/auth/contacts.readonly',
                    ];

                    GoogleSignIn googleSignIn = GoogleSignIn(
                      // Optional clientId
                      clientId: 'your-client_id.apps.googleusercontent.com',
                      scopes: scopes,
                    );
                    final result = await googleSignIn.signIn();
                    if (result != null) {
                      final googleKey = await result.authentication;
                      final token = googleKey.accessToken;
                      print(token);
                      print(googleKey);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: const CircleBorder()),
                  child: SvgPicture.asset(
                    'assets/icons/google.svg',
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
                Text(txt.notAMember),
                RichText(
                  text: TextSpan(
                    text: txt.signup,
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
