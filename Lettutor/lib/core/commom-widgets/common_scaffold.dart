import 'package:flutter/material.dart';
import 'package:lettutor/core/commom-widgets/appbar.dart';
import 'package:lettutor/core/commom-widgets/drawer.dart';

import '../constant.dart';

class CommonScaffold extends StatefulWidget {
  const CommonScaffold({super.key, required this.body});

  final Widget body;

  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: LettutorAppbar(
        onMenuIconPressed: () {
          _scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      endDrawer: width - 40 <= titleWidth ? const LettutorDrawer() : null,
      body: widget.body,
    );
  }
}
