
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'appbar.dart';

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

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: LettutorAppbar(),
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

          )
        )
    );
  }


}

class LoginForm extends StatefulWidget{
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _LoginFormState();

}


class _LoginFormState extends State<LoginForm>{
  
  @override
  Widget build(BuildContext context) {

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
                )
              )
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
                  ..onTap = (){

                  }
              )
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: (){},
              style: ButtonStyle(

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
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    shape: const CircleBorder()
                  ),
                  child: const Icon(Icons.facebook, color: Colors.blue,)
                ),
                OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: const CircleBorder()
                    ),
                    child: SvgPicture.asset('/icons/google.svg', height: 24,),
                ),
                OutlinedButton(
                    onPressed: (){},
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
                  text: const TextSpan(
                    text: "Sign up",
                    style: TextStyle(
                      color: Colors.blue,
                    )
                  )
                )
              ],
            ),
            const SizedBox(
              height: 60,
            )

            // TextSpan(
            //   onTap: (){},
            //   child: const Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'Forgot Password?',
            //       style: TextStyle(
            //         color: Colors.blue,
            //       ),
            //     ),
            //   ),
            // )
        ],
      ),
    );
  }

}