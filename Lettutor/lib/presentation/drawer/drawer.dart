import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/presentation/booking/booking_student.dart';

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
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Recurring Lesson Schedule'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.co_present),
            title: Text('Tutor'),
            onTap: (){
              Navigator.pushNamed(
                  context,
                  '/'
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text('Schedule'),
            onTap: (){
              Navigator.pushNamed(
                context,
                '/booking-student'
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: (){
              Navigator.pushNamed(
                  context,
                  '/history'
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Courses'),
            onTap: (){
              Navigator.pushNamed(
                  context,
                  '/courses'
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.collections_bookmark),
            title: Text('My course'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Become a tutor'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}
