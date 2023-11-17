import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/main.dart';

import '../appbar.dart';
import '../constant.dart';

class AdvertisingPage extends StatelessWidget {
  const AdvertisingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LoginAppbar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(builder: (context, constraint) {
                return Container(
                  margin: constraint.maxWidth > mobileWidth
                      ? const EdgeInsets.only(left: 64, top: 32, bottom: 32)
                      : const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  // height: MediaQuery.of(context).size.height,
                  width: constraint.maxWidth > mobileWidth
                      ? MediaQuery.of(context).size.width / 2
                      : double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LEARN ENGLISH ANYTIME, ANYWHERE",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: constraint.maxWidth > 600
                                ? Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .fontSize
                                : Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .fontSize,
                            color: Colors.blue.shade700),
                      ),
                      Text(
                        "Our talented tutor will help you to reach your goals by "
                        "one-on-one video",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      FilledButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RoutePath.login.getString());
                          },
                          child: Text("JOIN NOW"),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.blue.shade600,
                          )),
                    ],
                  ),
                );
              }),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: const BoxDecoration(
                  color: Color(0xfffff8ed),
                ),
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    if (constraint.maxWidth <= mobileWidth) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image(
                              image: Image.asset('images/communication.jpg').image,
                              height: MediaQuery.of(context).size.width / 2,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "New experience, new way for learner",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .fontSize,
                              ),
                            ),
                            Text(
                              "Build your English with our tutor from over the world now. "
                                  "All you need is your device",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .fontSize,
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            FilledButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RoutePath.login.getString());
                                },
                                child: Text("Get Started"),
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.blue.shade600,
                                )
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image:
                                  Image.asset('images/communication.jpg').image,
                              width: MediaQuery.of(context).size.width / 2.5,
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(
                              width: 32,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "New experience, new way for learner",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .fontSize,
                                    ),
                                  ),
                                  Text(
                                    "Build your English with our tutor from over the world now. "
                                    "All you need is your device",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .fontSize,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  FilledButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            RoutePath.login.getString());
                                      },
                                      child: Text("Get Started"),
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Colors.orange.shade900,
                                      )),
                                ],
                              ),
                            ),
                          ]);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
