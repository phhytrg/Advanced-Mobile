import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/app/app_settings/presentation/controllers/language_controller.dart';
import 'package:lettutor/app/app_settings/presentation/controllers/theme_mode_controller.dart';
import 'package:lettutor/app/app_settings/presentation/setting_page.dart';
import 'package:lettutor/core/route/auth_provider.dart';
import 'package:lettutor/core/theme/app_colors.dart';
import 'core/route/router.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AuthState authState = AuthState();
  await authState.init();

  configureUrl();
  runApp(
    ProviderScope(overrides: [
      authProvider.overrideWith((ref) => authState),
      // languageControllerProvider.overrideWith(() {
      //   return LanguageController()..getLanguage();
      // }),
      // themeModeControllerProvider.overrideWith(() {
      //   return ThemeModeController()..getThemeMode();
      // }),
    ], child: const MyApp()),
  );
}

class MyApp extends ConsumerStatefulWidget {
  // final AuthState authState;

  // const MyApp({super.key, required this.authState});
  const MyApp({super.key});

  // static void changeLocale(BuildContext context, Locale locale) async {
  //   _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  //   state?.changeLanguage();
  // }

  static Locale getLocale(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    return state?._locale ?? const Locale('en');
  }

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale _locale = const Locale('en');
  ThemeMode _themeMode = ThemeMode.light;

  changeLanguage() {
    setState(() {
      _locale = _locale == const Locale('en') ? const Locale('vi') : const Locale('en');
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(routerGeneratorProvider(ref.read(authProvider)));
    final language = ref.watch(languageControllerProvider);
    final isDarkMode = ref.watch(themeModeControllerProvider);
    language
        .whenData((value) => _locale = value == Language.vietnamese.value ? const Locale('vi') : const Locale('en'));
    isDarkMode.whenData((value) => _themeMode = value ? ThemeMode.dark : ThemeMode.light);

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
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.white,
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: AppColors.black,
          ),
          foregroundColor: AppColors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.grey.shade800,
            backgroundColor: Colors.grey.shade300,
          ),
        ),
        dividerColor: Colors.black12,
        dialogTheme: const DialogTheme(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
        ),
        primaryColorDark: Colors.grey.shade200,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.lightGrey,
          error: AppColors.error,
          background: AppColors.black,
        ),
        // backgroundColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.black,
          centerTitle: true,
          surfaceTintColor: AppColors.white,
          toolbarTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
          ),
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          foregroundColor: AppColors.white,
        ),
        dialogTheme: const DialogTheme(
          backgroundColor: AppColors.black,
          surfaceTintColor: AppColors.white,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).primaryTextTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade800,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        dividerColor: Colors.white12,
        primaryColorDark: Colors.grey.shade800,
      ),
      themeMode: _themeMode,
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
