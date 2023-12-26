import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/app/advertising/advertising.dart';
import 'package:lettutor/app/schedule/presentation/history_page.dart';
import 'package:lettutor/app/schedule/presentation/booking_student.dart';
import 'package:lettutor/app/signup/presentation/signup.dart';
import 'package:lettutor/core/route/auth_provider.dart';

import '../../app/login/presentation/login.dart';
import '../../app/tutors/presentation/tutor_standalone/tutor_page.dart';
import '../../app/tutors/presentation/tutors/tutors_page.dart';

enum AppRoute {
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
      case AppRoute.bookingStudents:
        return '/booking-student';
      case AppRoute.history:
        return '/history';
      case AppRoute.courses:
        return '/courses';
      case AppRoute.courseInfo:
        return '/course-info';
      case AppRoute.courseDetail:
        return '/course-detail';
      case AppRoute.tutor:
        return '/tutor';
      case AppRoute.tutorsList:
        return '/tutors';
      case AppRoute.login:
        return '/login';
      case AppRoute.signup:
        return '/signup';
      case AppRoute.resetPassword:
        return '/reset-password';
      default:
        return '/';
    }
  }
}

final goRouterProvider = Provider<GoRouter>((ref){
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();
  final authState = ref.watch(authStateProvider);
  return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'advertising',
          builder: (context, state) => AdvertisingPage(),
        ),
        GoRoute(
          path: '/login',
          name: AppRoute.login.name,
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: '/signup',
          name: AppRoute.signup.name,
          builder: (context, state) => SignupPage(),
        ),
        GoRoute(
          path: '/tutors',
          name: AppRoute.tutorsList.name,
          builder: (context, state) => TutorsPage(),
        ),
        GoRoute(
          path: '/tutor/:id',
          name: AppRoute.tutor.name,
          builder: (context, state) => TutorPage(
            tutorId: state.pathParameters['id'] ?? '',
          ),
        ),
        GoRoute(
          path: AppRoute.bookingStudents.getString(),
          name: AppRoute.bookingStudents.name,
          builder: (context, state) => BookingStudentPage(),
        ),
        GoRoute(
          path: AppRoute.history.getString(),
          name: AppRoute.history.name,
          builder: (context, state) => HistoryPage(),
        ),
      ],
      // redirect: (context, state) {
      //   if(authState == null) {
      //     if(state.matchedLocation != RoutePath.login.getString() && state.matchedLocation != '/'){
      //       return RoutePath.login.getString();
      //     }
      //     else{
      //       return null;
      //     }
      //   }
      //   else{
      //     if(state.matchedLocation == RoutePath.login.getString() || state.matchedLocation == '/'){
      //       return AppRoute.tutorsList.getString();
      //     }
      //     else{
      //       return null;
      //     }
      //   }
      //   return null;
      // }
  );
});
