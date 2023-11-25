import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'configure_nonweb.dart';
import 'core/route/auth_provider.dart';
import 'core/route/router.dart';

void main() {
  configureApp();
  runApp(
    ProviderScope(child: MyApp()),
  );
}

enum RoutePath {
  bookingStudents,
  tutor,
  tutorsList,
  history,
  courses,
  courseInfo,
  courseDetail,
  login,
  signup,
  resetPassword;

  String getString() {
    switch (this) {
      case RoutePath.bookingStudents:
        return '/booking-student';
      case RoutePath.history:
        return '/history';
      case RoutePath.courses:
        return '/courses';
      case RoutePath.courseInfo:
        return '/course-info';
      case RoutePath.courseDetail:
        return '/course-detail';
      case RoutePath.tutor:
        return '/tutor';
      case RoutePath.tutorsList:
        return '/tutors';
      case RoutePath.login:
        return '/login';
      case RoutePath.signup:
        return '/signup';
      case RoutePath.resetPassword:
        return '/reset-password';
      default:
        return '/';
    }
  }
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _authProvider = AuthState();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appRouter = AppRouter(_authProvider);
    final goRouter = ref.watch(goRouterProvider);

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
