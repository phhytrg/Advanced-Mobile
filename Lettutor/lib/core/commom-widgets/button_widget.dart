import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class MyTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const MyTextButton({super.key, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      hoverColor: Colors.transparent,
      textColor: Colors.blue,
      child: child,
    );
  }
}
