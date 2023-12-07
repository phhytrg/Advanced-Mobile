import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/app/courses/presentation/course_standalone/course_standalone_page.dart';
import 'package:lettutor/app/courses/presentation/courses_page.dart';
import 'package:lettutor/app/login/presentation/reset_password.dart';
import 'package:lettutor/app/schedule/presentation/history_page.dart';
import 'package:lettutor/app/schedule/presentation/booking_student.dart';
import 'package:lettutor/app/signup/presentation/signup.dart';
import 'package:lettutor/app/user_profile/presentation/user_profile_page.dart';
import 'package:lettutor/core/commom-widgets/appbar.dart';
import 'package:lettutor/core/commom-widgets/common_scaffold.dart';
import 'package:lettutor/core/presentation/advertising/advertising.dart';
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
  profile,
  resetPassword;

  String getPath() {
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
      case AppRoute.profile:
        return '/profile';
      default:
        return '/';
    }
  }
}

final goRouterProvider = Provider<GoRouter>((ref){
  final authState = ref.watch(authStateProvider);
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
      navigatorKey: rootNavigatorKey,
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
          parentNavigatorKey: rootNavigatorKey,
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
          path: AppRoute.bookingStudents.getPath(),
          name: AppRoute.bookingStudents.name,
          builder: (context, state) => BookingStudentPage(),
        ),
        GoRoute(
          path: AppRoute.history.getPath(),
          name: AppRoute.history.name,
          builder: (context, state) => HistoryPage(),
        ),
        GoRoute(
          path: AppRoute.courses.getPath(),
          name: AppRoute.courses.name,
          builder: (context, state){
            if(state.uri.queryParameters['id'] != null){
              return CourseStandalonePage(
                courseId: state.uri.queryParameters['id'] ?? '',
              );
            }
            else{
              return CoursesPage();
            }
          }
        ),
        GoRoute(
          path: AppRoute.courseInfo.getPath(),
          name: AppRoute.courseInfo.name,
          builder: (context, state) => CourseStandalonePage(
            courseId: state.pathParameters['id'] ?? '',
          ),
        ),
        GoRoute(
          path: AppRoute.resetPassword.getPath(),
          name: AppRoute.resetPassword.name,
          builder: (context, state) => ResetPasswordPage(),
        ),
        GoRoute(
          path: AppRoute.profile.getPath(),
          name: AppRoute.profile.name,
          builder: (context, state) => UserProfilePage(),
        ),
        // GoRoute(
        //   parentNavigatorKey: rootNavigatorKey,
        //   path: AppRoute.profile.getPath(),
        //   name: AppRoute.profile.name,
        //   builder: (context, state) => UserProfilePage(),
        // ),
        // ShellRoute(
        //   navigatorKey: shellNavigatorKey,
        //   builder: (context, state, child) {
        //     return LettutorAppbar();
        //   },
        //   routes: [
        //     GoRoute(
        //       parentNavigatorKey: shellNavigatorKey,
        //       path: AppRoute.profile.getPath(),
        //       name: AppRoute.profile.name,
        //       builder: (context, state) => UserProfilePage(),
        //     ),
        //   ],
        // )
      ],
      // redirect: (context, state) {
      //   if(authState == null) {
      //     if (state.matchedLocation != AppRoute.login.getPath() &&
      //         state.matchedLocation != AppRoute.signup.getPath() &&
      //         state.matchedLocation != AppRoute.resetPassword.getPath() &&
      //         state.matchedLocation != '/') {
      //       return AppRoute.login.getPath();
      //     }
      //     else{
      //       return null;
      //     }
      //   }
      //   else{
      //     if(state.matchedLocation == AppRoute.login.getPath() || state.matchedLocation == '/'){
      //       return AppRoute.tutorsList.getPath();
      //     }
      //     else{
      //       return null;
      //     }
      //   }
      //   return null;
      // }
  );
});
