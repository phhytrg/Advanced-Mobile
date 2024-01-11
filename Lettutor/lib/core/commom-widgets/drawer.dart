import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/core/route/router.dart';

class LettutorDrawer extends StatefulWidget {
  const LettutorDrawer({super.key});

  @override
  State<LettutorDrawer> createState() => _LettutorDrawerState();
}

class _LettutorDrawerState extends State<LettutorDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox.expand(
                // width: 100,
                child: SvgPicture.asset(
                  "assets/icons/lettutor-logo.svg",
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('User'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Recurring Lesson Schedule'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.co_present),
            title: const Text('Tutor'),
            onTap: () {
              GoRouter.of(context).go(AppRoute.tutorsList.getPath());
            },
          ),
          ListTile(
            leading: const Icon(Icons.event_available),
            title: const Text('Schedule'),
            onTap: () {
              GoRouter.of(context).go(AppRoute.bookingStudents.getPath());
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              GoRouter.of(context).go(AppRoute.history.getPath());
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Courses'),
            onTap: () {
              GoRouter.of(context).go(AppRoute.courses.getPath());
            },
          ),
          ListTile(
            leading: const Icon(Icons.collections_bookmark),
            title: const Text('My course'),
            onTap: () {

            },
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text('Become a tutor'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
