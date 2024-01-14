
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget{
  const CustomAlertDialog({super.key, this.title, this.content, this.actions});

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: title,
      content: content,
      actions: actions,
    );
  }

}

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      title: const Row(
        children: [
          Text(
            "Error",
            style: TextStyle(color: Colors.red),
          ),
          Icon(
            Icons.error,
            color: Colors.red,
          ),
        ],
      ),
      content: const Text("Something went wrong", style: TextStyle(color: Colors.red)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }

}