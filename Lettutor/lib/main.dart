import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/route/router.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureUrl();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerGeneratorProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      scrollBehavior: MyCustomerScrollBehavior(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Colors.black12,
              )),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          isDense: true,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.blue,
              ),
              elevation: 0,
            )),
        textTheme: GoogleFonts.poppinsTextTheme(Theme
            .of(context)
            .textTheme),
      ),
    );
  }
}

class MyCustomerScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
  };
}
