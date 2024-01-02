import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/app/advertising/advertising_page.dart';
import 'package:lettutor/app/auth/presentation/login_page.dart';
import 'package:lettutor/app/auth/presentation/reset_password.dart';
import 'package:lettutor/app/courses/presentation/course_standalone/course_standalone_page.dart';
import 'package:lettutor/app/courses/presentation/course_standalone/course_topics_page.dart';
import 'package:lettutor/app/courses/presentation/courses_page.dart';
import 'package:lettutor/app/courses/presentation/pdf_viewer_page.dart';
import 'package:lettutor/app/schedule/presentation/history_page.dart';
import 'package:lettutor/app/schedule/presentation/booking_student.dart';
import 'package:lettutor/app/signup/presentation/signup.dart';
import 'package:lettutor/app/tutors/presentation/tutor_standalone/tutor_page.dart';
import 'package:lettutor/app/tutors/presentation/tutors/tutors_page.dart';
import 'package:lettutor/core/commom-widgets/app_scaffold.dart';
import 'package:lettutor/core/route/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

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
  courseTopics,
  pdfViewer,
  advertising,
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
      case AppRoute.courseTopics:
        return '/course-topics';
      case AppRoute.pdfViewer:
        return '/pdf-viewer';
      case AppRoute.advertising:
        return '/';
    }
  }
}

@Riverpod(keepAlive: true)
GoRouter routerGenerator(RouterGeneratorRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();
  final authState = ref.watch(authStateProvider);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    refreshListenable: authState,
    redirect: (context, state) {
      List<String>unAuthoredRoutes = [
        AppRoute.login.getPath(),
        AppRoute.signup.getPath(),
        AppRoute.resetPassword.getPath(),
        AppRoute.advertising.getPath(),
      ];
      if (authState.loggedIn == false) {
        if (!unAuthoredRoutes.contains(state.matchedLocation)) {
          return AppRoute.login.getPath();
        }
        return null;
      } else {
        if (unAuthoredRoutes.contains(state.matchedLocation)) {
          return AppRoute.tutorsList.getPath();
        }
        return null;
      }
    },
    routes: [
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          routes: [
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
              builder: (context, state) {
                return CoursesPage();
              },
            ),
            GoRoute(
              path: AppRoute.pdfViewer.getPath(),
              name: AppRoute.pdfViewer.name,
              builder: (context, state) {
                return PdfViewerPage();
              },
            ),
            GoRoute(
                path: '/course-info/:id',
                name: AppRoute.courseInfo.name,
                builder: (context, state) => CourseStandalonePage(
                      courseId: state.pathParameters['id'] ?? '',
                    )
            ),
            // GoRoute(
            //   path: AppRoute.courseDetail.getString(),
            //   name: AppRoute.courseDetail.name,
            //   builder: (context, state) => CourseDetailPage(),
            // ),
            GoRoute(
              path: AppRoute.courseTopics.getPath(),
              name: AppRoute.courseTopics.name,
              builder: (context, state) => CourseTopicsPage(),
            ),
          ],
          builder: (context, state, child) {
            return AppScaffold(child: child);
          }),
      GoRoute(
        path: AppRoute.advertising.getPath(),
        name: AppRoute.advertising.name,
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
        path: '/reset-password',
        name: AppRoute.resetPassword.name,
        builder: (context, state) => ResetPasswordPage(),
      ),
    ],
    // redirect: (context, state) {
    //   authState.whenData((isAuthenticated) {
    //     if (isAuthenticated == false) {
    //       if (state.matchedLocation != AppRoute.login.getString() && state.matchedLocation != '/') {
    //         GoRouter.of(context).pushReplacement(AppRoute.login.getString());
    //       }
    //     } else {
    //       if (state.matchedLocation == AppRoute.login.getString() || state.matchedLocation == '/') {
    //         context.pushReplacement(AppRoute.tutorsList.getString());
    //       }
    //     }
    //   });
    //   return null;
    // },
    //   return null;
    //   // if(authState == null) {
    //   //   if(state.matchedLocation != AppRoute.login.getString() && state.matchedLocation != '/'){
    //   //     return AppRoute.login.getString();
    //   //   }
    //   //   else{
    //   //     return null;
    //   //   }
    //   // }
    //   // else{
    //   //   if(state.matchedLocation == AppRoute.login.getString() || state.matchedLocation == '/'){
    //   //     return AppRoute.tutorsList.getString();
    //   //   }
    //   //   else{
    //   //     return null;
    //   //   }
    //   // }
    // }
  );
}
