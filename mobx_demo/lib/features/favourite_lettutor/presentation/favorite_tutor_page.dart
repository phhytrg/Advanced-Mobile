import 'package:flutter/material.dart';

class FavoriteTutorPage extends StatelessWidget {
  const FavoriteTutorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TutorCard extends StatelessWidget {
  const TutorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(),
        Text('Tutor Name'),
      ],
    );
  }
}
