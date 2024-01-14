
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/app/user_profile/presentation/controller/user_controller.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/route/router.dart';
import 'package:lettutor/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constant.dart';

class LettutorAppbar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuIconPressed;

  const LettutorAppbar({super.key, this.onMenuIconPressed});

  @override
  State<LettutorAppbar> createState() => _LettutorAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LettutorAppbarState extends State<LettutorAppbar> {
  final List _hoverNavBar = [false, false, false, false, false];
  bool showAvatarButton = false;

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context)!;
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
            onPressed: () {
              MyApp.changeLocale(context, const Locale('vi'));
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              backgroundColor: Colors.grey[100], // <-- Button color
              foregroundColor: Colors.grey[500], // <-- Splash color
            ),
            child: SvgPicture.asset(
              MyApp.getLocale(context).languageCode == 'en'
                  ? "assets/icons/usa-flag.svg"
                  : "assets/icons/vietnam-flag.svg",
              width: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Builder(builder: (context) {
          if (MediaQuery.of(context).size.width <= titleWidth) {
            return IconButton(onPressed: widget.onMenuIconPressed, icon: Icon(Icons.menu));
          } else {
            return MouseRegion(
              onEnter: (value) {
                setState(() {
                  showAvatarButton = true;
                });
              },
              onExit: (value) {
                setState(() {
                  showAvatarButton = false;
                });
              },
              child: Consumer(builder: (context, ref, child) {
                final userState = ref.watch(userControllerProvider);
                return AsyncValueWidget(
                  value: userState,
                  data: (user) {
                    return InkWell(
                      onTap: () {
                        showDialog<void>(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    height: 100,
                                    width: 200,
                                    margin: const EdgeInsets.only(top: 64, right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          width: double.infinity,
                                          height: 30,
                                          child: Material(
                                            child: InkWell(
                                              onTap: () {
                                                context.go(AppRoute.profile.getPath());
                                              },
                                              child: Align(alignment: Alignment.center,child: Text(txt.profile)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 30,
                                          child: Material(
                                            child: InkWell(
                                              onTap: () {
                                                context.go(AppRoute.registerTutor.getPath());
                                              },
                                              child: Align(alignment: Alignment.center,child: Text(txt.becomeTutor)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 30,
                                          child: Material(
                                            child: InkWell(
                                              onTap: () {
                                              },
                                              child: Align(alignment: Alignment.center,child: Text(txt.logout)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hi, ${user.name}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('${int.parse(user.walletInfo.amount) / 100000} lessons left',
                                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: Image.network(user.avatar).image,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            );
          }
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
    final currentRoutePath = Router.of(context).routeInformationProvider?.value.uri;
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
            context.go(AppRoute.tutorsList.getPath());
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
                color: _hoverNavBar[0] || currentRoutePath.toString() == AppRoute.tutorsList.getPath()
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
            context.go(AppRoute.bookingStudents.getPath());
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
                color: _hoverNavBar[1] || currentRoutePath.toString() == AppRoute.bookingStudents.getPath()
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
            context.go(AppRoute.history.getPath());
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
                color: _hoverNavBar[2] || currentRoutePath.toString() == AppRoute.history.getPath()
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
            context.go(AppRoute.courses.getPath());
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
                color: _hoverNavBar[3] || currentRoutePath.toString() == AppRoute.courses.getPath()
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
            context.go(AppRoute.courses.getPath());
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
                    // || currentRoutePath.toString() == RoutePath.courses.getString()
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
              onPressed: () {
                MyApp.changeLocale(context, const Locale('vi'));
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.grey[100], // <-- Button color
                foregroundColor: Colors.grey[500], // <-- Splash color
              ),
              child: SvgPicture.asset(
                MyApp.getLocale(context).languageCode == 'en'
                    ? "assets/icons/usa-flag.svg"
                    : "assets/icons/vietnam-flag.svg",
                width: 20,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
