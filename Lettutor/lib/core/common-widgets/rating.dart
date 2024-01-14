import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int i = 0; i < rating; i++)
          const Icon(Icons.star, color: Colors.amber,),
        for(int i = 0; i < 5 - rating; i++)
          const Icon(Icons.star_border, color: Colors.amber,),
      ],
    );
  }
}
