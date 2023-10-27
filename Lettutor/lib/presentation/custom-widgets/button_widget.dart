import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class MyTextButton extends StatelessWidget {
  final Widget child;
  const MyTextButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){},
      padding: EdgeInsets.zero,
      hoverColor: Colors.transparent,
      textColor: Colors.blue,
      child: child,
    );
  }
}
