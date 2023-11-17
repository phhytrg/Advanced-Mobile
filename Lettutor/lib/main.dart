import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/app/presentation/tutors_list/tutors_page.dart';

import 'app/presentation/advertising/advertising.dart';
import 'app/presentation/booking/booking_student.dart';
import 'app/presentation/courses/course_detail_page.dart';
import 'app/presentation/courses/course_information_page.dart';
import 'app/presentation/courses/courses_page.dart';
import 'app/presentation/history/history_page.dart';
import 'app/login/presentation/login.dart';
import 'app/presentation/signup/signup.dart';
import 'app/presentation/tutor/tutor_page.dart';
import 'configure_nonweb.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

enum RoutePath{
  bookingStudents, tutor, tutorsList, history, courses, courseInfo, courseDetail, login, signup;

  String getString(){
    switch (this){
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
      default:
        return '/';
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        RoutePath.bookingStudents.getString(): (context) => BookingStudentPage(),
        RoutePath.tutor.getString(): (context) => TutorPage(),
        RoutePath.tutorsList.getString(): (context) => TutorsPage(),
        RoutePath.history.getString(): (context) => HistoryPage(),
        RoutePath.courses.getString(): (context) => CoursesPage(),
        RoutePath.courseInfo.getString(): (context) => CourseInformationPage(),
        RoutePath.courseDetail.getString(): (context) => CourseDetailPage(),
        RoutePath.login.getString(): (context) => LoginPage(),
        RoutePath.signup.getString(): (context) => SignupPage(),
      },
      // builder: (context, child){
      //   double width = MediaQuery.of(context).size.width;
      //   return Scaffold(
      //     key: _scaffoldKey,
      //     appBar: LettutorAppbar(
      //       onMenuIconPressed: (){
      //         _scaffoldKey.currentState?.openEndDrawer();
      //       },
      //     ),
      //     endDrawer: width - 40 <= titleWidth ? LettutorDrawer() : null,
      //     body: child,
      //   );
      // },
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
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      home: AdvertisingPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
