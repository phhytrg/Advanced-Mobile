import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/main.dart';
import 'package:lettutor/presentation/constant.dart';

import 'booking/booking_student.dart';

class LettutorAppbar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuIconPressed;

  LettutorAppbar({super.key, this.onMenuIconPressed});

  @override
  State<LettutorAppbar> createState() => _LettutorAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LettutorAppbarState extends State<LettutorAppbar> {
  List _hoverNavBar = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(
          width: 180,
          child: SvgPicture.asset(
            "assets/icons/lettutor-logo.svg",
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              backgroundColor: Colors.grey[100], // <-- Button color
              foregroundColor: Colors.grey[500], // <-- Splash color
            ),
            child: SvgPicture.asset(
              "assets/icons/usa-flag.svg",
              width: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Builder(builder: (context) {
          if (MediaQuery.of(context).size.width <= titleWidth) {
            return IconButton(
                onPressed: widget.onMenuIconPressed, icon: Icon(Icons.menu));
          } else {
            return CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/course-image.png'),
            );
          }
          ;
        }),
        const SizedBox(
          width: 16,
        ),
      ],
      title: Builder(
        builder: (BuildContext context) {
          double width = MediaQuery.of(context).size.width;
          if (width > titleWidth) {
            return _buildTitle(context);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    String? currentRoutePath = ModalRoute.of(context)?.settings.name;
    return Row(
      children: [
        const SizedBox(
          width: 24,
        ),
        InkWell(
          hoverColor: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          splashColor: Colors.blue.shade50,
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
          onHover: (value) {
            setState(() {
              value ? _hoverNavBar[0] = true : _hoverNavBar[0] = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'TUTOR',
              style: TextStyle(
                color: _hoverNavBar[0]
                    || currentRoutePath == RoutePath.tutorsList.getString()
                    ? Colors.blue
                    : Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        InkWell(
          hoverColor: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          splashColor: Colors.blue.shade50,
          onTap: () {
            Navigator.pushReplacementNamed(context, '/booking-student');
          },
          onHover: (value) {
            setState(() {
              value ? _hoverNavBar[1] = true : _hoverNavBar[1] = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'SCHEDULE',
              style: TextStyle(
                color: _hoverNavBar[1]
                    || currentRoutePath == RoutePath.bookingStudents.getString()
                    ? Colors.blue
                    : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 24,
        ),
        InkWell(
          hoverColor: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          splashColor: Colors.blue.shade50,
          onTap: () {
            Navigator.pushReplacementNamed(context, '/history');
          },
          onHover: (value) {
            setState(() {
              value ? _hoverNavBar[2] = true : _hoverNavBar[2] = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'HISTORY',
              style: TextStyle(
                color: _hoverNavBar[2]
                    || currentRoutePath == RoutePath.history.getString()
                    ? Colors.blue
                    : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 24,
        ),
        InkWell(
          hoverColor: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          splashColor: Colors.blue.shade50,
          onTap: () {
            Navigator.pushReplacementNamed(context, '/courses',);
          },
          onHover: (value) {
            setState(() {
              value ? _hoverNavBar[3] = true : _hoverNavBar[3] = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'COURSES',
              style: TextStyle(
                color: _hoverNavBar[3]
                    || currentRoutePath == RoutePath.courses.getString()
                    ? Colors.blue
                    : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 24,
        ),
        InkWell(
          hoverColor: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          splashColor: Colors.blue.shade50,
          onTap: () {
            // Not yet implement
          },
          onHover: (value) {
            setState(() {
              value ? _hoverNavBar[4] = true : _hoverNavBar[4] = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'MY COURSE',
              style: TextStyle(
                color: _hoverNavBar[4]
                    // || currentRoutePath == RoutePath.myCourse.getString();
                    ? Colors.blue
                    : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginAppbar extends StatelessWidget implements PreferredSizeWidget {

  const LoginAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            width: 180,
            child: SvgPicture.asset(
              "assets/icons/lettutor-logo.svg",
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.grey[100], // <-- Button color
                foregroundColor: Colors.grey[500], // <-- Splash color
              ),
              child: SvgPicture.asset(
                "assets/icons/usa-flag.svg",
                width: 20,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);
}
