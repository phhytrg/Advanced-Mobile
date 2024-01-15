import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  final String text;

  const OutlinedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue[100]!.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(text,
          style: TextStyle(
            color: Colors.blue[800],
          ),
        )
    );
  }
}
