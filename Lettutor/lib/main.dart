import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/app/auth/data/local_auth_repository.dart';
import 'package:lettutor/core/route/auth_provider.dart';
import 'core/route/router.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  final AuthState authState = AuthState();
  await authState.init();

  configureUrl();
  runApp(
    ProviderScope(
      overrides: [
        authProvider.overrideWith((ref) => authState),
      ],
      child: MyApp()
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  // final AuthState authState;

  // const MyApp({super.key, required this.authState});
  const MyApp({super.key});

  static void changeLocale(BuildContext context, Locale locale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeLanguage();
  }

  static Locale getLocale(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    return state?._locale ?? const Locale('en');
  }

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale _locale = const Locale('en');

  changeLanguage() {
    setState(() {
      _locale = _locale == const Locale('en') ? const Locale('vi') : const Locale('en');
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(routerGeneratorProvider(ref.read(authProvider)));

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      scrollBehavior: MyCustomerScrollBehavior(),
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
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
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
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
