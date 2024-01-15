import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/core/common-widgets/appbar.dart';
import 'package:lettutor/core/constant.dart';
import 'package:lettutor/core/route/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class AdvertisingPage extends ConsumerWidget {
  const AdvertisingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txt = AppLocalizations.of(context)!;
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
                        txt.ads1,
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
                        txt.ads11,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      FilledButton(
                          onPressed: () {
                            GoRouter.of(context).goNamed(AppRoute.login.name);
                          },
                          child: Text(txt.joinNow),
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
                              image: Image.asset('assets/images/communication.jpg').image,
                              height: MediaQuery.of(context).size.width / 2,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              txt.ads2,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .fontSize,
                              ),
                            ),
                            Text(
                              txt.ads21,
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
                                  context.go(AppRoute.login.getPath());
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.blue.shade600,
                                ),
                                child: Text(txt.getStarted)
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
                                  Image.asset('assets/images/communication.jpg').image,
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
                                    txt.ads2,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .fontSize,
                                    ),
                                  ),
                                  Text(
                                    txt.ads21,
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
                                        context.pushReplacement(AppRoute.login.getPath());
                                      },
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Colors.orange.shade900,
                                      ),
                                      child: Text(txt.getStarted)),
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
