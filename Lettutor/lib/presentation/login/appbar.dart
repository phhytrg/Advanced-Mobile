
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LettutorAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double height;

  const LettutorAppbar({super.key, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: SvgPicture.asset(
          "assets/icons/lettutor-logo.svg",
        ),
      ),
      leadingWidth: 180,
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
          child: ElevatedButton(
            onPressed: (){},
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
        )
      ],
    );
  }



}